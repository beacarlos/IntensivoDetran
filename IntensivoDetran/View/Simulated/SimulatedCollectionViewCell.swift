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
    
    override var isSelected: Bool {
        didSet {
            self.butonCheck.alpha = 0
        }
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    override func setNeedsLayout() {
        self.butonCheck.alpha = 0
    }
    
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addBorder(side: .bottom, color: UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.00), width: 0.8)
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
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .black
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    lazy var butonCheck: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_checked"), for: .normal)
        button.backgroundColor = UIColor(red: 0.84, green: 0.95, blue: 0.93, alpha: 1.00)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.alpha = 0
        return button
    }()
}

extension SimulatedCollectionViewCell {
    private func setupUI() {
        self.contentView.addSubview(roundedBackgroundView)
        roundedBackgroundView.addSubview(titleLabel)
        roundedBackgroundView.addSubview(lineViewBackground)
        roundedBackgroundView.addSubview(butonCheck)
        
        NSLayoutConstraint.activate([
            roundedBackgroundView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            roundedBackgroundView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            roundedBackgroundView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, constant: -10),
            
            lineViewBackground.heightAnchor.constraint(equalTo: self.roundedBackgroundView.heightAnchor, constant: -30),
            lineViewBackground.widthAnchor.constraint(equalToConstant: 3),
            lineViewBackground.leadingAnchor.constraint(equalTo: self.roundedBackgroundView.leadingAnchor),
            lineViewBackground.centerYAnchor.constraint(equalTo: self.roundedBackgroundView.centerYAnchor),
            
            butonCheck.heightAnchor.constraint(equalToConstant: 40),
            butonCheck.widthAnchor.constraint(equalToConstant: 40),
            butonCheck.centerYAnchor.constraint(equalTo: self.lineViewBackground.centerYAnchor),
            butonCheck.trailingAnchor.constraint(equalTo: self.roundedBackgroundView.trailingAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: self.lineViewBackground.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: self.butonCheck.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.lineViewBackground.topAnchor, constant: 5)
        ])
    }
}
