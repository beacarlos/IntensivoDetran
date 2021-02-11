//
//  Ext+ActivityIndicator.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 10/02/21.
//

import Foundation
import UIKit
//swiftlint:disable private_over_fileprivate identifier_name
fileprivate var aView: UIView?

extension UIViewController {
    func showSpinner() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor(red: 0.82, green: 0.90, blue: 0.89, alpha: 0.8)
        
        let ai = UIActivityIndicatorView(style: .large)
        ai.center = aView!.center
        ai.startAnimating()
        
        aView?.addSubview(ai)
        self.view.addSubview(aView!)
        
        Timer.scheduledTimer(withTimeInterval: 50, repeats: false) { _ in
            self.removeSpinner()
        }
    }
    
    func removeSpinner() {
        aView?.removeFromSuperview()
        aView = nil
    }
}
