//
//  AppHeaderView.swift
//  AppStore
//
//  Created by Manoel Filho on 29/01/21.
//

import UIKit

class AppsControllerHeader: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var cellId = "cellId"
    
    var appsFeatured: [FeaturedApp] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //layout default
        // let layout = UICollectionViewFlowLayout()
        
        //layout da lib Lib/SnappingLayout que permite uma navegacao com travas nas celulas. Evita deixar a célula pela metade na tela
        let layout = SnappingLayout()
        
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //deixa o movimento do scroll mais ágil - usado com o auxilio do SnappingLayout fica otimo
        collectionView.decelerationRate = .fast
        
        //tira a barra de rolagem debaixo do scroll
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        collectionView.preencherSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

//MARK: UICollectionViewDelegate Methods
extension AppsControllerHeader {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appsFeatured.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
        cell.appFeatured = self.appsFeatured[indexPath.item]
        return cell
    }
    
}

//MARK: UICollectionViewFlowLayout
extension AppsControllerHeader {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: bounds.width - 40, height: bounds.height - 1)
    }
}
