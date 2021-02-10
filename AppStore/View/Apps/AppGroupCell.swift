//
//  AppGroupCell.swift
//  AppStore
//
//  Created by Manoel Filho on 30/01/21.
//

import UIKit

class AppGroupCell: UICollectionViewCell {
    
    var group: AppGroup? {
        didSet {
            if let group = group {
                titleLabel.text = group.titulo
                appsGroupHorizontal.apps = group.apps
            }
        }
    }
    
    let titleLabel: UILabel = .textBold(text: "app group title", fontSize: 24)
    
    let appsGroupHorizontal = AppsControllerHorizontal()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        //backgroundColor = .blue
        
        addSubview(titleLabel)
        titleLabel.preencher(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        addSubview(appsGroupHorizontal.view)
        appsGroupHorizontal.view.preencher(
            top: titleLabel.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
