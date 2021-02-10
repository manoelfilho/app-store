//
//  AppsGroupHorizontalCell.swift
//  AppStore
//
//  Created by Manoel Filho on 30/01/21.
//

import UIKit

class AppsGroupHorizontalCell: UICollectionViewCell {
    
    var app: App? {
        didSet{
            if let app = app {
                icon.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                titleLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    
    let icon: UIImageView = .iconImageView()
    let titleLabel: UILabel = .textLabel(text: "App name", fontSize: 18, numberOfLines: 2)
    let companyLabel: UILabel = .textLabel(text: "App name empresa", fontSize: 14)
    
    let getButton: UIButton = .getButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 80, y: bounds.height, width: bounds.width, height: 0.8)
        bottomLine.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.addSublayer(bottomLine)
        
        //backgroundColor = .yellow
        
        let companyLabelStackView = UIStackView(arrangedSubviews: [
            titleLabel,
            companyLabel
        ])
        companyLabelStackView.spacing = 4
        companyLabelStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [
            icon,
            companyLabelStackView,
            getButton
        ])
        
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.preencherSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
