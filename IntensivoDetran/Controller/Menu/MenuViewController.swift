//
//  MenuViewController.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 04/02/21.
//

import UIKit

class MenuViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    var menuView: MenuView = {
        let view = MenuView(frame: UIScreen.main.bounds)
        view.buttonSimuleted.addTarget(self, action: #selector(buttonSimuletedAction), for: .touchUpInside)
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
    
    @objc func buttonSimuletedAction(sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.menuView.descriptionLabel.alpha = 0
            self.menuView.titleDescriptionLabel.alpha = 0
            self.menuView.viewDescription.alpha = 0
            self.menuView.titleLabel.alpha = 0
            self.menuView.imageViewTop.alpha = 0
            self.menuView.viewTop.alpha = 0
            self.menuView.buttonSimuleted.alpha = 0
        }, completion: { _ in
            let newViewController = SimulatedViewController()
            self.navigationController?.pushViewController(newViewController, animated: true)
        })
    }
    
    func nukeAllAnimations() {
        self.view.subviews.forEach({$0.layer.removeAllAnimations()})
        self.view.layer.removeAllAnimations()
        self.view.layoutIfNeeded()
    }
}
