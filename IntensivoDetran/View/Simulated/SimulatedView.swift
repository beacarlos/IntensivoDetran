//
//  SimulatedView.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 04/02/21.
//

import UIKit

class SimulatedView: UIView, ViewEssential {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .whiteColor
        setupConstraints()
    }
    
    func setupConstraints() {}
}
