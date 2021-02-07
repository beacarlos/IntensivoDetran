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
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.text = "A) indicar e orientar os usuários da via sobre os locais onde podem dispor de serviços auxiliares, como também contêm informações relacionadas à direção a seguir."
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
            roundedBackgroundView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: self.roundedBackgroundView.topAnchor),
            
            lineViewBackground.widthAnchor.constraint(equalToConstant: 3),
            lineViewBackground.heightAnchor.constraint(equalTo: self.titleLabel.heightAnchor, constant: 10),
            lineViewBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
        
    }
}
