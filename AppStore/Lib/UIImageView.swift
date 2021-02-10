//
//  UIImageView.swift
//  AppStore
//
//  Created by Manoel Filho on 29/01/21.
//

import UIKit

extension UIImageView {
    
    static func iconImageView(width: CGFloat = 64, height: CGFloat = 64) -> UIImageView{
       
        let image = UIImageView()
        
        image.size(size: .init(width: width, height: height))
        image.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.3254398683)
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        
        return image
        
    }
    
    static func screenShotImageView() -> UIImageView {
        
        let image = UIImageView()
        
        image.backgroundColor = .purple
        image.layer.cornerRadius = 12
        image.layer.borderWidth = 0.5
        image.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.3254398683)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
        return image
        
    }
    
    static func todayImageView(named: String? = nil) -> UIImageView {

        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        if let named = named {
            myImage.image = UIImage(named: named)
        }
        myImage.contentMode = .scaleAspectFit
        return myImage
    
    }
    
}
