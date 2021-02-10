//
//  AppDetalheScreenShotCell.swift
//  AppStore
//
//  Created by Manoel Filho on 02/02/21.
//

import UIKit

class AppDetalheScreenShotCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var app:App? {
        didSet {
            if app != nil {
                self.collectionView.reloadData()
            }
        }
    }
    
    let cellId = "cellId"
    
    let titleLabel: UILabel = .textBold(text: "Pré-visualizar", fontSize: 24)
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .white
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(titleLabel)
        titleLabel.preencher(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20)
        )
        
        addSubview(collectionView)
        collectionView.preencher(
            top: titleLabel.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 0, bottom: 0, right: 0)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension AppDetalheScreenShotCell {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.app?.screenshotUrls?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenShotCell
        
        if let imageURL = self.app?.screenshotUrls?[indexPath.item] {
            cell.imageView.sd_setImage(with: URL(string: imageURL), completed: nil)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 200, height: collectionView.bounds.height)
    }
    
}

class ScreenShotCell: UICollectionViewCell {
    
    let imageView: UIImageView = .screenShotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.image = UIImage(named: "screenshot")
        
        addSubview(imageView)
        imageView.preencherSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
