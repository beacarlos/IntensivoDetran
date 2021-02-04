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
    
    lazy var numberQuestionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "01 / 40"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textColor = .colorPrimary
        label.sizeToFit()
        label.font = .systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        return label
    }()
    
    lazy var progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(0.025, animated: true)
        progressView.trackTintColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        progressView.tintColor = .colorPrimary
        progressView.layer.masksToBounds = true
        progressView.layer.cornerRadius = 4
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    lazy var stopButton: UIButton = {
        let button = UIButton()
        button.setTitle("Parar", for: .normal)
        button.setTitleColor(.actionColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupUI() {
        self.backgroundColor = .whiteColor
        setupConstraints()
    }
    
    func setupConstraints() {
        self.addSubview(progressBar)
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            progressBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.55),
            progressBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 9)
        ])
        
        self.addSubview(numberQuestionLabel)
        NSLayoutConstraint.activate([
            numberQuestionLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            numberQuestionLabel.trailingAnchor.constraint(equalTo: self.progressBar.leadingAnchor, constant: -10)
        ])
        
        self.addSubview(stopButton)
        NSLayoutConstraint.activate([
            stopButton.centerYAnchor.constraint(equalTo: self.progressBar.centerYAnchor, constant: -2),
            stopButton.leadingAnchor.constraint(equalTo: self.progressBar.trailingAnchor, constant: 15)
        ])
    }
}
