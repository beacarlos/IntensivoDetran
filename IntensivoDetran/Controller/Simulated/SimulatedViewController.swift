//
//  SimulatedViewController.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 04/02/21.
//

import UIKit

class SimulatedViewController: UIViewController {
    var questionsResult = [Question]()
    var answerCorrect = Array(repeating: 0, count: 40)
    
    private var count = 0
    private let max = 40
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    var simulatedView: SimulatedView = {
        let view = SimulatedView(frame: UIScreen.main.bounds)
        view.stopButton.addTarget(self, action: #selector(buttonStopAction), for: .touchUpInside)
        view.buttonNext.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = simulatedView
        self.showSpinner()
        setDelegatesCollectionView()
        responseData()
    }
    
    override func loadView() {
        super.loadView()
    }
    
    private func responseData() {
        let service = SimulatedViewModel(baseUrl: "https://api-idetran.herokuapp.com/api/")
        service.getAllQuestions(endpoint: "getAll") { questions in
            guard let questions = questions else { return }
            self.questionsResult = questions.shuffled()
            DispatchQueue.main.async {
                self.setData(with: self.questionsResult, count: self.count, max: self.max)
                self.simulatedView.collectionSimulated.reloadData()
                self.removeSpinner()
            }
        }
    }
    
    private func setData(with data: [Question], count: Int, max: Int) {
        self.simulatedView.numberQuestionLabel.text = "\(count == max ? count : (count + 1)) / 40"
        self.simulatedView.questionTitleLabel.text = "Questão \(count == max ? count : (count + 1))"
        self.simulatedView.progressBar.setProgress(0.025 * Float(self.count), animated: true)
        self.simulatedView.questionLabel.text = data[count].description
        
    }
    
    private func setDelegatesCollectionView() {
        self.simulatedView.collectionSimulated.delegate = self
        self.simulatedView.collectionSimulated.dataSource = self
    }
    
    @objc func buttonStopAction(sender: UIButton) {
        let alert = UIAlertController(title: "Tem certeza?", message: "O simulado irá ser finalizado.", preferredStyle: UIAlertController.Style.alert)
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Sim, tenho certeza.", style: UIAlertAction.Style.default, handler: { (_) in
            let resultViewController = ResultViewController()
            resultViewController.answerCorrect = self.answerCorrect
            self.navigationController?.pushViewController(resultViewController, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Não, cancelar.", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func nextButtonAction(sender: UIButton) {
        if count < 39 {
            self.count += 1
            setData(with: self.questionsResult, count: self.count, max: max)
            self.simulatedView.collectionSimulated.reloadData()
        } else {
            let resultViewController = ResultViewController()
            resultViewController.answerCorrect = self.answerCorrect
            navigationController?.pushViewController(resultViewController, animated: true)
        }
        
        if count == 38 {
            self.simulatedView.buttonNext.setTitle("Finalizar", for: .normal)
        }
    }
}

extension SimulatedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.simulatedView.collectionSimulated.dequeueReusableCell(withReuseIdentifier: "SimulatedCollectionViewCell", for: indexPath) as? SimulatedCollectionViewCell else { return SimulatedCollectionViewCell() }
        
        if !self.questionsResult.isEmpty {
            if let answer =  self.questionsResult[count].answers?[indexPath.row] {
                cell.titleLabel.text = answer.description
                cell.tag = answer.correctAnswer == true ? 1 : 0
                collectionView.contentOffset = .zero
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SimulatedCollectionViewCell {
            cell.butonCheck.alpha = 1
            answerCorrect[self.count] = cell.tag
        }
    }
}
