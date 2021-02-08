//
//  ResultView.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 08/02/21.
//

import UIKit

class ResultView: UIView, ViewEssential {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        setupConstraints()
        self.backgroundColor = .whiteColor
    }
    
    func setupConstraints() {}
    
}
