//
//  ResultVC.swift
//  AlcoolouGasolinaApp
//
//  Created by Danilo Santos on 12/02/2024.
//

import UIKit

enum BestFuel: String {
    case ethanol = "Álcool"
    case gas = "Gasolina"
}

class ResultVC: UIViewController {
    
    private var screen: ResultScreen?
    let bestFuel: BestFuel
    
    init(bestFuel: BestFuel) {
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.screen = ResultScreen()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.resultLabel.text = bestFuel.rawValue

    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }

}

extension ResultVC: ResultScreenProtocol {
    func actionCalculateButtonAgain() {
        popViewController()
    }
    
    
}
