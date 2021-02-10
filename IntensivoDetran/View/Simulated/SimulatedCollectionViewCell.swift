//
//  SimulatedCollectionViewCell.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 05/02/21.
//

import UIKit

class SimulatedCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()
    
    lazy var lineViewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .actionColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 1
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
}

extension SimulatedCollectionViewCell {
    private func setupUI() {
        self.contentView.addSubview(roundedBackgroundView)
        roundedBackgroundView.addSubview(titleLabel)
        roundedBackgroundView.addSubview(lineViewBackground)
        
        NSLayoutConstraint.activate([
            roundedBackgroundView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            roundedBackgroundView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, constant: -10),
            
            lineViewBackground.heightAnchor.constraint(equalTo: self.roundedBackgroundView.heightAnchor),
            lineViewBackground.widthAnchor.constraint(equalToConstant: 2),
            
//            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: self.roundedBackgroundView.leadingAnchor),
//            titleLabel.trailingAnchor.constraint(equalTo: self.roundedBackgroundView.trailingAnchor),
//            titleLabel.topAnchor.constraint(equalTo: self.roundedBackgroundView.topAnchor)
        ])
        
    }
}
