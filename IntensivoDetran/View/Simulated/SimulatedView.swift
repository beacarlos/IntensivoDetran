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
        progressView.setProgress(0, animated: true)
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
    
    lazy var questionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Questão 1"
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.44, green: 0.49, blue: 0.56, alpha: 1.00)
        label.font = UIFont(name: "Cuprum-Bold", size: 15)
        return label
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textAlignment = .left
        label.textColor = .darkText
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame.size.width = 300
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var collectionSimulated: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout(sectionInset: UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10), scrollDirection: .vertical, minimumInteritemSpacing: 0, minimumLineSpacing: 0, itemSize: CGSize(width: UIScreen.main.bounds.width - 30, height: 120)))
        collectionView.register(SimulatedCollectionViewCell.self, forCellWithReuseIdentifier: "SimulatedCollectionViewCell")
        collectionView.backgroundColor = .whiteColor
        collectionView.showsVerticalScrollIndicator = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var buttonNext: UIButton = {
        let button = UIButton()
        button.setTitle("Próxima", for: .normal)
        button.setTitleColor(.whiteColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .actionColor
        button.layer.cornerRadius = 13
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 22, bottom: 15, right: 22)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func collectionViewLayout(sectionInset: UIEdgeInsets, scrollDirection: UICollectionView.ScrollDirection, minimumInteritemSpacing: CGFloat = 0, minimumLineSpacing: CGFloat = 0, itemSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)) -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = sectionInset
        layout.scrollDirection = scrollDirection
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = minimumLineSpacing
        layout.itemSize = itemSize
        
        return layout
    }
    
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
        
        self.addSubview(questionTitleLabel)
        NSLayoutConstraint.activate([
            questionTitleLabel.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor, constant: 50),
            questionTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: self.questionTitleLabel.bottomAnchor, constant: 16),
            questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        self.addSubview(buttonNext)
        NSLayoutConstraint.activate([
            buttonNext.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonNext.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        self.addSubview(collectionSimulated)
        NSLayoutConstraint.activate([
            collectionSimulated.topAnchor.constraint(equalTo: self.questionLabel.bottomAnchor, constant: 30),
            collectionSimulated.widthAnchor.constraint(equalTo: self.widthAnchor),
            collectionSimulated.bottomAnchor.constraint(equalTo: self.buttonNext.topAnchor, constant: -30)
        ])
    }
}
