//
//  ResultViewController.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 08/02/21.
//

import UIKit

class ResultViewController: UIViewController {
    var answerCorrect = [Int]()
    var resultView: ResultView = {
        let view = ResultView(frame: UIScreen.main.bounds)
        view.buttonBackToMenu.addTarget(self, action: #selector(backToMenuAction), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = resultView
        showScore()
    }
    
    func showScore() {
        let score = answerCorrect.filter { $0 == 1 }.count
        self.resultView.circularProgressView.setProgressWithAnimation(duration: 1.0, value: Float(score) * 0.025)
        self.resultView.scoreLabel.text = "\(score) / 40"
        self.resultView.scoreSubLabel.text = (Float(score) * 0.25) >= 7.0 ? "Excelente!" : "Tente de novo!"
        self.resultView.scoreTextSubLabel.text = (Float(score) * 0.25) >= 7.0 ? "Você tirou \(Float(score) * 0.25), com essa nota \npassaria na prova do Detran!" : "Você tirou \(Float(score) * 0.25), com essa nota \n não passaria na prova do Detran, \ncontinue estudando!"
    }
    
    @objc func backToMenuAction(sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
