//
//  ResultViewController.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 08/02/21.
//

import UIKit
//swiftlint:disable force_cast
class ResultViewController: UIViewController {
    var answerCorrect = [Int]()
    var resultView: ResultView = {
        let view = ResultView(frame: UIScreen.main.bounds)
        view.buttonBackToMenu.addTarget(self, action: #selector(backToMenuAction), for: .touchUpInside)
        return view
    }()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var score: [Score]? {
        didSet {
            print(score!.count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showScore()
    }
    
    override func loadView() {
        super.loadView()
        self.view = resultView
//        fetchScore()
    }
    
    private func fetchScore() {
        do {
            self.score = try context.fetch(Score.fetchRequest())

//            DispatchQueue.main.async {
//                tableView.reloadData()
//            }
        } catch let error {
            print("Ocorreu um erro ao trazer os dados do core data: \(error.localizedDescription)")
        }
    }
    
    func saveScore(score: Float, result: Int) {
        // instanciando a entidade do core data e passando a classe de contexto.
        let newScore = Score(context: self.context)
        newScore.result = Int16(result)
        newScore.score = score
        newScore.createdAt = Date()
        
        // save
        do {
            try self.context.save()
        } catch let error {
            print("Ocorreu um erro ao salva-lo: \(error.localizedDescription)")
        }
        
        // reload data
        fetchScore()
    }
    
    private func showScore() {
        let result = answerCorrect.filter { $0 == 1 }.count
        let score = (Float(result) * 0.25)
        self.saveScore(score: score, result: result)
        
        self.resultView.circularProgressView.setProgressWithAnimation(duration: 1.0, value: 0.025)
        self.resultView.scoreLabel.text = "\(result) / 40"
        self.resultView.scoreSubLabel.text = score >= 7.0 ? "Excelente!" : "Tente de novo!"
        self.resultView.scoreTextSubLabel.text = score >= 7.0 ? "Você tirou \(score), com essa nota passaria na prova do Detran!" : "Você tirou \(score), com essa nota não passaria na prova do Detran, continue estudando!"
    }
    
    @objc func backToMenuAction(sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
