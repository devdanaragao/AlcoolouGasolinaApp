//
//  CaculatorScreen.swift
//  AlcoolouGasolinaApp
//
//  Created by Danilo Santos on 12/02/2024.
//

import UIKit

protocol CalculatorScreenProtocol: AnyObject {
    func actionCalculateButton()
    func actionBackButton()
}

class CalculatorScreen: UIView {
    
    private weak var delegate: CalculatorScreenProtocol?
    
    public func delegate(delegate: CalculatorScreenProtocol?) {
        self.delegate = delegate
    }
    
    static let identifier: String = String (describing: CalculatorScreen.self)
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bgBlurDark")
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
    
    lazy var alcoolPriceTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço do Alcool"
        tf.textColor = .darkGray
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    lazy var gasolinaPriceTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço da Gasolina"
        tf.textColor = .darkGray
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(pressCalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func pressCalculateButton(_ sender: UIButton) {
        delegate?.actionCalculateButton()
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "botaoBack"), for: .normal)
        button.addTarget(self, action: #selector(pressBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func pressBackButton(_ sender: UIButton) {
        delegate?.actionBackButton()
    }
    
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
        self.addSubview(self.alcoolPriceTextField)
        self.addSubview(self.gasolinaPriceTextField)
        self.addSubview(self.calculateButton)
        self.addSubview(self.backButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.alcoolPriceTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 134),
            self.alcoolPriceTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.alcoolPriceTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.alcoolPriceTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.gasolinaPriceTextField.topAnchor.constraint(equalTo: self.alcoolPriceTextField.bottomAnchor, constant: 20),
            self.gasolinaPriceTextField.leadingAnchor.constraint(equalTo: self.alcoolPriceTextField.leadingAnchor),
            self.gasolinaPriceTextField.trailingAnchor.constraint(equalTo: self.alcoolPriceTextField.trailingAnchor),
            self.gasolinaPriceTextField.heightAnchor.constraint(equalTo: self.alcoolPriceTextField.heightAnchor),
            
            self.calculateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -135),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
    
}
