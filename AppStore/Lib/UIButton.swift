//
//  UIButton.swift
//  AppStore
//
//  Created by Manoel Filho on 29/01/21.
//

import UIKit

extension UIButton {
    
    static func getButton() -> UIButton {
        
        let buttom = UIButton()
        
        buttom.setTitle("Obter", for: .normal)
        buttom.setTitleColor(UIColor.blue, for: .normal)
        buttom.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        buttom.size(size: .init(width: 80, height: 32))
        buttom.layer.cornerRadius = 16
        buttom.clipsToBounds = true
        buttom.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        return buttom
        
    }
    
    static func getCloseButton() -> UIButton {
        
        let buttom = UIButton()
        
        buttom.setImage(UIImage(named: "fechar"), for: .normal)
        buttom.layer.zPosition = 2
        
        return buttom
        
    }
    
}
