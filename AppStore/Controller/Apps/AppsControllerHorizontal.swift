//
//  AppGroupHorizontalCell.swift
//  AppStore
//
//  Created by Manoel Filho on 30/01/21.
//

import UIKit

class AppsControllerHorizontal: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var apps: [App] = []
    
    let cellId = "cellId"
    
    var calback: ( (App) -> () )? //var do tipo funcao
    
    init() {
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
    
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        //para criar a trava na navegacao do slide
        collectionView.decelerationRate = .fast
        
        //removendo o indicador do scroll
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.register(AppsGroupHorizontalCell.self, forCellWithReuseIdentifier: cellId)
    }
}

//MARK: UICollectionViewController Methods

extension AppsControllerHorizontal {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupHorizontalCell
        cell.app = self.apps[indexPath.item]
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout Methods
extension AppsControllerHorizontal {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 40, height: view.bounds.height / 3 - 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.calback?(self.apps[indexPath.item])
    }
    
}
