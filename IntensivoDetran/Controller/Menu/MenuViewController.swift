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
        view.buttonSimulated.addTarget(self, action: #selector(buttonSimulatedAction), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = menuView
    }
    
    @objc func buttonSimulatedAction(sender: UIButton) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.menuView.descriptionLabel.alpha = 0
            self.menuView.titleDescriptionLabel.alpha = 0
            self.menuView.viewDescription.alpha = 0
            self.menuView.titleLabel.alpha = 0
            self.menuView.imageViewTop.alpha = 0
            self.menuView.viewTop.alpha = 0
            self.menuView.buttonSimulated.alpha = 0
        }, completion: { _ in
            let newViewController = SimulatedViewController()
            self.navigationController?.pushViewController(newViewController, animated: true)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseIn, animations: {
            self.menuView.descriptionLabel.alpha = 1
            self.menuView.titleDescriptionLabel.alpha = 1
            self.menuView.viewDescription.alpha = 1
            self.menuView.titleLabel.alpha = 1
            self.menuView.imageViewTop.alpha = 1
            self.menuView.viewTop.alpha = 1
            self.menuView.buttonSimulated.alpha = 1
        })
    }
}
