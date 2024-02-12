//
//  CalculatorVC.swift
//  AlcoolouGasolinaApp
//
//  Created by Danilo Santos on 12/02/2024.
//

import UIKit

class CalculatorVC: UIViewController {
    
    private var screen: CalculatorScreen?
    var alert: Alert?
    
    override func loadView() {
        self.screen = CalculatorScreen()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.screen?.delegate(delegate: self)
        alert = Alert(controller: self)
    }
    
    func validateTextFields() -> Bool {
        
        guard let ethanolPrice = screen?.alcoolPriceTextField.text else { return false }
        guard let gasPrice = screen?.gasolinaPriceTextField.text else { return false }
        
        if ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe os valores do Álcool e da Gasolina")
            return false
        } else if ethanolPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor do Álcool")
            return false
        } else if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor da Gasolina")
            return false
        }
        return true
    }

}

extension CalculatorVC: CalculatorScreenProtocol {
    func actionCalculateButton() {
        
//        let vc = ResultVC()
//        navigationController?.pushViewController(vc, animated: true)
        
        if validateTextFields() {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            let ethanolPrice: Double = (formatter.number(from: screen?.alcoolPriceTextField.text ?? "0.0")
                                        as? Double) ?? 0.0
            let gasPrice: Double = (formatter.number(from: screen?.gasolinaPriceTextField.text ?? "0.0")
                                    as? Double) ?? 0.0
            
            var vc: ResultVC?
            if ethanolPrice / gasPrice > 0.7 {
                vc = ResultVC(bestFuel: .gas)
            } else {
                vc = ResultVC(bestFuel: .ethanol)
            }
            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
    }
    
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
