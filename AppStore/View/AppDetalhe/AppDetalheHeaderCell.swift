//
//  AppDetalheHeaderCell.swift
//  AppStore
//
//  Created by Manoel Filho on 02/02/21.
//

import UIKit

class AppDetalheHeaderCell: UICollectionViewCell {
    
    var app: App? {
        didSet{
            if let app = app {
                iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                nameLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    
    let iconImageView: UIImageView = .iconImageView(width: 128, height: 128)
    let nameLabel: UILabel = .textBold(text: "App Name", fontSize: 20, numberOfLines: 2)
    let companyLabel: UILabel = .textLabel(text: "App company", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconImageView.image = UIImage(named: "icone")
        
        let buttonStackView = UIStackView(arrangedSubviews: [getButton, UIView()])
        
        let companyTitleStackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel, buttonStackView])
        companyTitleStackView.spacing = 12
        companyTitleStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, companyTitleStackView])
        stackView.alignment = .center
        stackView.spacing = 12
    
        addSubview(stackView)
        stackView.preencherSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
