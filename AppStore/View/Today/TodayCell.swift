//
//  TodayCell.swift
//  AppStore
//
//  Created by Manoel Filho on 06/02/21.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
               
                self.categoryLabel.text = todayApp.categoria
                self.descriptionLabel.text = todayApp.descricao
                self.titleLabel.text = todayApp.titulo
                
                if let image = todayApp.imagemUrl {
                    self.todayImageView.image = UIImage(named: image)
                }
                
                if let backgroundColor = todayApp.backgroundColor {
                    self.backgroundColor = UIColor(hexString: backgroundColor)
                }
                
            }
        }
    }
    
    let categoryLabel: UILabel = .textLabel(text: "Viagem", fontSize: 18)
    let titleLabel: UILabel = .textLabel(text: "Explore o mundo sem medo", fontSize: 28, numberOfLines: 2)
    let todayImageView: UIImageView = .todayImageView(named: "destaque-1")
    let descriptionLabel: UILabel = .textLabel(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget commodo ante. Integer nisl lacus, bibendum ac lacus ac, euismod interdum sem. Nam a semper ex, a porta lorem. In id sapien odio.", fontSize: 14, numberOfLines: 3)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let boxImageView = UIView()
        boxImageView.clipsToBounds = true
        boxImageView.addSubview(todayImageView)
        todayImageView.centerXAnchor.constraint(equalTo: boxImageView.centerXAnchor).isActive = true
        todayImageView.centerYAnchor.constraint(equalTo: boxImageView.centerYAnchor).isActive = true
        todayImageView.size(size: .init(width: bounds.width, height: 250))
        
        
        let stackView = UIStackView(arrangedSubviews: [
            categoryLabel,
            titleLabel,
            boxImageView,
            descriptionLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.preencherSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
