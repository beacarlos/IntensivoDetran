//
//  ResultViewController.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 08/02/21.
//

import UIKit

class ResultViewController: UIViewController {
    var resultView: ResultView = {
        let view = ResultView(frame: UIScreen.main.bounds)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = resultView
    }
}
