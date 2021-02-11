//
//  ResultView.swift
//  IntensivoDetran
//
//  Created by Beatriz Carlos on 08/02/21.
//

import UIKit

class ResultView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Resultado"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "Cuprum-Bold", size: 32)
        return label
    }()
    
    lazy var circularProgressView: CircularProgressBar = {
        let cBar = CircularProgressBar(frame: CGRect(x: 0, y: -10, width: 220, height: 220))
        cBar.trackColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        cBar.progressColor = .colorPrimary
        cBar.tag = 101
        cBar.center = CGPoint(x: self.frame.width / 2, y: self.frame.height * 0.28)
        self.perform(#selector(animateProgress), with: nil, afterDelay: 0.5)
        return cBar
    }()
    
    @objc func animateProgress() {
        self.circularProgressView.setProgressWithAnimation(duration: 1.0, value: 0.7)
    }
    
    lazy var viewCircle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorPrimaryLight
        return view
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Cuprum-Bold", size: 40)
        return label
    }()
    
    lazy var scoreSubLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Cuprum-Bold", size: 30)
        return label
    }()
    
    lazy var scoreTextSubLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 4
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Cuprum-Bold", size: 25)
        return label
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
        label.text = "Para se dar bem na prova"
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.07, green: 0.08, blue: 0.08, alpha: 1.00)
        label.font = UIFont(name: "Cuprum-Bold", size: 20)
        label.alpha = 1
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Você tem que tirar uma \npontuação igual ou maior que \n7, ou seja, tem que acertar no \nmínimo 28 questões!"
        label.textAlignment = .left
        label.numberOfLines = 4
        label.textColor = .colorCaption
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    lazy var buttonBackToMenu: UIButton = {
        let button = UIButton()
        button.setTitle("Voltar ao menu", for: .normal)
        button.setTitleColor(.whiteColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .actionColor
        button.layer.cornerRadius = 13
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 22, bottom: 15, right: 22)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.viewCircle.layer.cornerRadius = viewCircle.frame.size.width / 2
    }
    
    private func setupUI() {
        setupConstraints()
        self.backgroundColor = .whiteColor
    }
    
    private func setupConstraints() {
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        ])
        
        self.addSubview(circularProgressView)
        
        self.addSubview(viewCircle)
        NSLayoutConstraint.activate([
            viewCircle.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 45),
            viewCircle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            viewCircle.widthAnchor.constraint(equalToConstant: 200),
            viewCircle.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        self.viewCircle.addSubview(scoreLabel)
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: self.viewCircle.topAnchor, constant: 50),
            scoreLabel.centerXAnchor.constraint(equalTo: self.viewCircle.centerXAnchor)
        ])
        
        self.viewCircle.addSubview(scoreSubLabel)
        NSLayoutConstraint.activate([
            scoreSubLabel.topAnchor.constraint(equalTo: self.scoreLabel.bottomAnchor, constant: 14),
            scoreSubLabel.centerXAnchor.constraint(equalTo: self.viewCircle.centerXAnchor)
        ])
        
        self.addSubview(scoreTextSubLabel)
        NSLayoutConstraint.activate([
            scoreTextSubLabel.topAnchor.constraint(equalTo: self.circularProgressView.bottomAnchor, constant: 40),
            scoreTextSubLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.addSubview(buttonBackToMenu)
        NSLayoutConstraint.activate([
            self.buttonBackToMenu.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            self.buttonBackToMenu.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.addSubview(viewDescription)
        NSLayoutConstraint.activate([
            self.viewDescription.bottomAnchor.constraint(equalTo: self.buttonBackToMenu.topAnchor, constant: -60),
            self.viewDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 34),
            self.viewDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -34),
            self.viewDescription.heightAnchor.constraint(equalToConstant: 170)
        ])
        
        self.viewDescription.addSubview(titleDescriptionLabel)
        NSLayoutConstraint.activate([
            self.titleDescriptionLabel.topAnchor.constraint(equalTo: self.viewDescription.topAnchor, constant: 35),
            self.titleDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -25)
        ])
        
        self.viewDescription.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleDescriptionLabel.bottomAnchor, constant: 6),
            self.descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
