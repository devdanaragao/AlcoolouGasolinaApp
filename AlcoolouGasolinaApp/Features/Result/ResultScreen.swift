//
//  ResultScreen.swift
//  AlcoolouGasolinaApp
//
//  Created by Danilo Santos on 12/02/2024.
//

import UIKit

protocol ResultScreenProtocol: AnyObject {
    func actionCalculateButtonAgain()
//    func actionBackButton()
}

class ResultScreen: UIView {
    
    private weak var delegate: ResultScreenProtocol?
    
    public func delegate(delegate: ResultScreenProtocol?) {
        self.delegate = delegate
    }

    static let identifier: String = String (describing: ResultScreen.self)
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logoMenor")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 31)
        label.text = "Abasteça com:"
        return label
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 73)
        return label
    }()
    
    lazy var calculateButtonAgain: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular Novamente", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(pressCalculateButtonAgain), for: .touchUpInside)
        return button
    }()
    
    @objc private func pressCalculateButtonAgain(_ sender: UIButton) {
        delegate?.actionCalculateButtonAgain()
    }
    
//    lazy var backButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(UIImage(named: "botaoBack"), for: .normal)
//        button.addTarget(self, action: #selector(pressBackButton), for: .touchUpInside)
//        return button
//    }()
    
//    @objc private func pressBackButton(_ sender: UIButton) {
//        delegate?.actionBackButton()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(self.backgroundImage)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.sentenceLabel)
        self.addSubview(self.resultLabel)
        self.addSubview(self.calculateButtonAgain)
//        self.addSubview(self.backButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
//            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.sentenceLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 100),
            self.sentenceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            self.resultLabel.topAnchor.constraint(equalTo: self.sentenceLabel.bottomAnchor, constant: 12),
            self.resultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.calculateButtonAgain.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -135),
            self.calculateButtonAgain.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.calculateButtonAgain.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.calculateButtonAgain.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
}
