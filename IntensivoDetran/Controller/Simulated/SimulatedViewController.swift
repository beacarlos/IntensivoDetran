//
//  SimulatedViewController.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 04/02/21.
//

import UIKit

class SimulatedViewController: UIViewController {
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
    }
    
    override func loadView() {
        super.loadView()
        self.view = simulatedView
    }
    
    func setDelegatesCollectionView() {
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
        return cell
    }
}
