//
//  AppDetalheDescriptionCell.swift
//  AppStore
//
//  Created by Manoel Filho on 02/02/21.
//

import UIKit


class AppDetalheDescriptionCell: UICollectionViewCell {
    
    var app:App? {
        didSet {
            if let app = app {
                descriptionLabel.text = app.avaliacao
                descriptionLabel.text = app.descricao
            }
        }
    }

    let titleLabel: UILabel = .textBold(text: "Novidade", fontSize: 24)
    let descriptionLabel: UILabel = .textLabel(text: "Descricao", fontSize: 12, numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackview = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackview.spacing = 12
        stackview.axis = .vertical
        
        addSubview(stackview)
        stackview.preencherSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
