//
//  SimulatedViewController.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 04/02/21.
//

import UIKit

class SimulatedViewController: UIViewController {
    var questionsResult = [Question]()
    var answerCorrect = [Int]()
    let count = 0, max = 40
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    var simulatedView: SimulatedView = {
        let view = SimulatedView(frame: UIScreen.main.bounds)
        view.stopButton.addTarget(self, action: #selector(buttonStopAction), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegatesCollectionView()
        responseData()
    }
    
    override func loadView() {
        super.loadView()
        self.view = simulatedView
    }
    
    func responseData() {
        let service = SimulatedViewModel(baseUrl: "https://api-idetran.herokuapp.com/api/")
        service.getAllQuestions(endpoint: "getAll") { questions in
            guard let questions = questions else { return }
            self.questionsResult = questions
            self.setData(with: self.questionsResult, count: self.count, max: self.max)
            DispatchQueue.main.async {
                self.simulatedView.collectionSimulated.reloadData()
            }

        }
    }
    
    func setData(with data: [Question], count: Int, max: Int) {
        self.simulatedView.numberQuestionLabel.text = "\(count == max ? count : (count + 1)) / 40"
        self.simulatedView.progressBar.setProgress(0.025 * Float(count), animated: true)
        self.simulatedView.questionTitleLabel.text = "Questão \(count == max ? count : (count + 1))"
        self.simulatedView.questionLabel.text = data[count].description

    }
    
    private func setDelegatesCollectionView() {
        self.simulatedView.collectionSimulated.delegate = self
        self.simulatedView.collectionSimulated.dataSource = self
    }
    
    @objc func buttonStopAction(sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
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
            }
        }
        return cell
    }
}
