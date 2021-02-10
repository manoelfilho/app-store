//
//  TodayViewController.swift
//  AppStore
//
//  Created by Manoel Filho on 06/02/21.
//

import UIKit

class TodayViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    var apps: [TodayApp] = []
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //remover o cabecalho do TodayViewController que está dentro de um UINavigationController
        navigationController?.navigationBar.isHidden = true
        
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellID)
        
        self.returnFeaturedApps()
    }
    
    func returnFeaturedApps() {
        AppService.shared.returnTodayFeatured { (apps, error) in
            if let apps = apps {
                DispatchQueue.main.async {
                    self.apps = apps
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}


//MARK: UICollectionViewController Methods
extension TodayViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TodayCell
        cell.todayApp = self.apps[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //pega a celula clicada
        if let cell = collectionView.cellForItem(at: indexPath){
            
            //pegando a posicao exata onde a celula foi clicada
            if let frame = cell.superview?.convert(cell.frame, to: nil) {
                
//                //cria uma nova view Simples
//                let modalView = UIView()
//                modalView.frame = frame
//                modalView.backgroundColor = .red
//
//                //coloca a nova view exatamente no local da celula
//                view.addSubview(modalView)
                
                tabBarController?.tabBar.isHidden = true
                
                let modalView = TodayDetailViewController()
                
                //onde o modal deve carregar
                modalView.modalPresentationStyle = .overCurrentContext
                
                modalView.handleClose = {
                    self.tabBarController?.tabBar.isHidden = false
                }
                
                self.present(modalView, animated: true){
                    modalView.frame = frame
                    modalView.addUnique()
                }
                
            }
        }
        
    }
    
}


//MARK: UICollectionViewDelegateFlowLayout Methods
/*
    UICollectionViewDelegateFlowLayout me permite trabalahar com métodos que lidam com o layout das celulas
 */
extension TodayViewController {
    
    //definindo o tamanho das celulas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 48, height: view.bounds.width + 48)
    }
    
    //defeinindo o espaço minimo entre as celulas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
}
