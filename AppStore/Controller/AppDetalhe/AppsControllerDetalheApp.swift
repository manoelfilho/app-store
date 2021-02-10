//
//  AppDetalhe.swift
//  AppStore
//
//  Created by Manoel Filho on 02/02/21.
//

import UIKit

class AppsControllerDetalheApp: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let headerID = "headerID"
    let descriptionID = "descriptionID"
    let screenShotCellId = "screenShotCellId"
    let avaliacaoCellId = "avaliacaoCellId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    var appId: Int! {
        didSet{
            self.returnApp(appId: appId)
        }
    }
    var app: App?
    
    var loading: Bool = true
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        
        super .viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetalheHeaderCell.self, forCellWithReuseIdentifier: headerID)
        collectionView.register(AppDetalheDescriptionCell.self, forCellWithReuseIdentifier: descriptionID)
        collectionView.register(AppDetalheScreenShotCell.self, forCellWithReuseIdentifier: screenShotCellId)
        collectionView.register(AppDetalheAvaliacaoCell.self, forCellWithReuseIdentifier: avaliacaoCellId)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralizasSuperview()
        
    }
    
}

//MARK: UICollectionViewController Methods
extension AppsControllerDetalheApp {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.loading ? 1 : 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //validacao para saber o tipo de celula que deve retornar
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerID, for: indexPath) as! AppDetalheHeaderCell
            cell.app = self.app
            return cell
        }
        
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionID, for: indexPath) as!AppDetalheDescriptionCell
            cell.app = self.app
            return cell
        }
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenShotCellId, for: indexPath) as!AppDetalheScreenShotCell
            cell.app = self.app
            return cell
        }
        
        if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: avaliacaoCellId, for: indexPath) as! AppDetalheAvaliacaoCell
            cell.app = self.app
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}

//MARK: UICollectionViewDelegateFlowLayout Methods
extension AppsControllerDetalheApp {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = view.bounds.width
        var height: CGFloat = 170
        
        //Hash para determinar o tamanho da celula da descricao do conteúdo em descricao
        if indexPath.item == 1 {
            
            let descriptionCell = AppDetalheDescriptionCell(frame: CGRect(x: 0, y: 0, width: width, height: 1000))
            descriptionCell.app = self.app
            descriptionCell.layoutIfNeeded()
            let estimateHeightCell = descriptionCell.systemLayoutSizeFitting(CGSize(width: width, height: 1000))
            height = estimateHeightCell.height
        }
        
        
        if indexPath.item == 2 {
            height = 550
        }
        
        if indexPath.item == 3 {
            height = 280
        }
        
        return .init(width: width, height: height)
    }
    
}

extension AppsControllerDetalheApp {
    
    func returnApp(appId: Int){
        AppService.shared.returnApp(appId: appId) { (app, err) in
            if let app = app {
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.loading = false
                    self.app = app
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}
