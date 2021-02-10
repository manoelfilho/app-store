//
//  UILabel.swift
//  AppStore
//
//  Created by Manoel Filho on 29/01/21.
//

import UIKit

extension UILabel {
    
    static func textLabel(text: String, fontSize:CGFloat, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        label.text = text
        
        return label
    }
    
    static func textBold(text: String, fontSize:CGFloat, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        label.text = text
        
        return label
    }
    
}
