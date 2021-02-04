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
    }
    
    override func loadView() {
        super.loadView()
        self.view = simulatedView
    }
    
    @objc func buttonStopAction(sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
