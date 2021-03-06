//
//  MenuView.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 04/02/21.
//

import UIKit

//swiftlint:disable discouraged_direct_init switch_case_alignment
class MenuView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .whiteColor
        setupConstraints()
    }
    
    lazy var viewTop: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorPrimary
        view.clipsToBounds = true
        view.layer.cornerRadius = 11
        view.alpha = 1
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pronto para começar?"
        label.textAlignment = .center
        label.textColor = .whiteColor
        label.alpha = 1
        label.font = UIFont(name: "Cuprum-Bold", size: 28)
        return label
    }()
    
    lazy var imageViewTop: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_menu")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 1
        return imageView
    }()
    
    lazy var viewDescription: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorPrimaryLight
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        view.alpha = 1
        return view
    }()
    
    lazy var titleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A prova teórica do Detran"
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.07, green: 0.08, blue: 0.08, alpha: 1.00)
        label.alpha = 1

        switch UIDevice().type {
        case .iPhoneSE:
            label.font = .systemFont(ofSize: 18)
        default:
            label.font = UIFont(name: "Cuprum-Bold", size: 20)
        }
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ela tem um total de 40 \nquestões e a pontuação é de \n0 a 10 pontos. Bons estudos!"
        label.textAlignment = .left
        label.numberOfLines = 3
        label.textColor = .colorCaption
        label.font = .systemFont(ofSize: 18)
        
        switch UIDevice().type {
        case .iPhoneSE:
            label.font = .systemFont(ofSize: 15)
        default:
            label.font = .systemFont(ofSize: 18)
        }
        return label
    }()
    
    lazy var buttonSimulated: UIButton = {
        let button = UIButton()
        button.setTitle("    Começar um simulado", for: .normal)
        button.setTitleColor(.colorCaption, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        button.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.96, alpha: 1.00)
        button.layer.cornerRadius = 13
        button.layer.borderColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.00).cgColor
        button.layer.borderWidth = 1
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 15)
        button.setImage(UIImage(named: "ic_simulated"), for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupConstraints() {
        self.addSubview(viewTop)
        NSLayoutConstraint.activate([
            self.viewTop.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewTop.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.viewTop.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ])
        
        self.viewTop.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
        
        self.viewTop.addSubview(imageViewTop)
        NSLayoutConstraint.activate([
            self.imageViewTop.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 50),
            self.imageViewTop.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageViewTop.bottomAnchor.constraint(equalTo: self.viewTop.bottomAnchor, constant: -20)
        ])
        
        self.addSubview(buttonSimulated)
        NSLayoutConstraint.activate([
            self.buttonSimulated.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            self.buttonSimulated.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.buttonSimulated.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        self.addSubview(viewDescription)
        NSLayoutConstraint.activate([
            self.viewDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            self.viewDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35)
        ])
        
        switch UIDevice().type {
            case .iPhoneSE:
                self.viewDescription.heightAnchor.constraint(equalToConstant: 140).isActive = true
                self.viewDescription.topAnchor.constraint(equalTo: self.viewTop.bottomAnchor, constant: 20).isActive = true

            default:
                self.viewDescription.heightAnchor.constraint(equalToConstant: 165).isActive = true
                self.viewDescription.topAnchor.constraint(equalTo: self.viewTop.bottomAnchor, constant: 60).isActive = true
        }
        
        self.viewDescription.addSubview(titleDescriptionLabel)
        NSLayoutConstraint.activate([
            self.titleDescriptionLabel.topAnchor.constraint(equalTo: self.viewDescription.topAnchor, constant: 35),
            self.titleDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -15)
        ])
        
        self.viewDescription.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleDescriptionLabel.bottomAnchor, constant: 6),
            self.descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
