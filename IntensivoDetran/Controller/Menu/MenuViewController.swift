//
//  MenuViewController.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 04/02/21.
//

import UIKit

class MenuViewController: UIViewController {
    var menuView: MenuView = {
        let view = MenuView(frame: UIScreen.main.bounds)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func loadView() {
        super.loadView()
        self.view = menuView
    }
    
    private func setupUI() {}
}
