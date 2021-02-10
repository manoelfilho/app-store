//
//  AppHeaderCell.swift
//  AppStore
//
//  Created by Manoel Filho on 29/01/21.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    var appFeatured: FeaturedApp? {
        didSet {
            if let appFeatured = appFeatured {
                companyLabel.text = appFeatured.nome
                descriptionLabel.text = appFeatured.descricao
                imageView.sd_setImage(with: URL(string: appFeatured.imagemUrl), completed: nil)
            }
        }
    }
    
    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 12)
    let descriptionLabel:UILabel = .textLabel(text: "App descricao header", fontSize: 20, numberOfLines: 2)
    let imageView: UIImageView = .screenShotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLabel.textColor = UIColor.blue
        
        let stackView = UIStackView(arrangedSubviews: [companyLabel, descriptionLabel, imageView])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.preencherSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
