//
//  Simulated.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 09/02/21.
//

import Foundation

class SimulatedViewModel {
    weak var simulatedViewController: SimulatedViewController?
    var questions = [Question]()
    
    func getAllQuestions(completion: @escaping ([Question]?) -> Void) {
        HTTP.get.request(url: URL(string: "https://api-idetran.herokuapp.com/api/getAll")!) { (data, _ response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let results = try JSONDecoder().decode([Question].self, from: data)
                completion(results)
            } catch {
                print(error)
            }
        }
    }
    
    func getCategories(completion: @escaping ([Categories]?) -> Void) {
        HTTP.get.request(url: URL(string: "https://api-idetran.herokuapp.com/api/getCategories")!) { (data, _ response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let results = try JSONDecoder().decode([Categories].self, from: data)
                completion(results)
            } catch {
                print(error)
            }
        }
    }
}

enum HTTP {
    case get
    
    func request(url: URL?,
                 header: [String: String] = ["Content-Type": "application/json"],
                 body: [String: Any] = [:],
                 completion: @escaping (Data?, HTTPURLResponse?, String?) -> Void = { data, response, error in }) {
        
        guard let url = url else {
            completion(nil, nil, "Erou! URL Invalida")
            return
        }
        
        switch self {
        case .get:
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                completion(data, response as? HTTPURLResponse, error?.localizedDescription)
            }.resume()
        }
    }
}
