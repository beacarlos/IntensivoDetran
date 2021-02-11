//
//  Simulated.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 09/02/21.
//

import Foundation
import Alamofire

class SimulatedViewModel {
    weak var simulatedViewController: SimulatedViewController?
    var questions = [Question]()
    
    fileprivate var baseUrl = ""
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getAllQuestions(endpoint: String, completion: @escaping ([Question]?) -> Void) {
        AF.request(self.baseUrl + endpoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else { return }
            
            do {
                let questions = try JSONDecoder().decode([Question].self, from: data)
                completion(questions)

            } catch {
                completion(nil)
            }
        }
    }
}
