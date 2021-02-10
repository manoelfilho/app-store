//
//  AppsController.swift
//  AppStore
//
//  Created by Manoel Filho on 29/01/21.
//

import UIKit

class AppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    var appsFeatured: [FeaturedApp] = []
    var appsGroupedBy: [AppGroup] = []
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        //registro do cabecalho
        collectionView.register(AppsControllerHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        //registro da celula
        collectionView.register(AppGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralizasSuperview()
        
//        self.returnFeatured()
//        self.returnGroupsOfApps(type: "apps-que-amamos")
//        self.returnGroupsOfApps(type: "top-apps-gratis")
//        self.returnGroupsOfApps(type: "top-apps-pagos")
        
        
        self.returnAllApps()
        
    }
    
}

//MARK: - UICollectionView Methods

extension AppsController {
    
    //registro do cabecalho - header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsControllerHeader
        header.appsFeatured = self.appsFeatured
        header.collectionView.reloadData() //isso é necessário para recarregar os dados da view
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.width * 0.8)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appsGroupedBy.count
    }

    //registro das celulas de baixo do cabecalho
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppGroupCell
        cell.group = self.appsGroupedBy[indexPath.item]
        
        cell.appsGroupHorizontal.calback = { (app) in
            let appDetalhe = AppsControllerDetalheApp()
            appDetalhe.appId = app.id
            appDetalhe.app = app
            self.navigationController?.pushViewController(appDetalhe, animated: true)
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: 280)
    }
    
}


// MARK: Service Apps
extension AppsController {
    
    func returnAllApps(){
    
        var appsFeatured: [FeaturedApp]?
        var appsQueAmamos: AppGroup?
        var appsTopGratis: AppGroup?
        var appsPagos: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        
        AppService.shared.returnFeatured { (apps, err) in
            appsFeatured = apps
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        
        AppService.shared.returnGroupOfApps(type: "apps-que-amamos") { (apps, err) in
            appsQueAmamos = apps
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        
        AppService.shared.returnGroupOfApps(type: "top-apps-gratis") { (apps, err) in
            appsTopGratis = apps
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        
        AppService.shared.returnGroupOfApps(type: "top-apps-pagos") { (apps, err) in
            appsPagos = apps
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            
            if let apps = appsFeatured {
                self.appsFeatured = apps
            }
            if let app = appsQueAmamos {
                self.appsGroupedBy.append(app)
            }
            if let app = appsTopGratis {
                self.appsGroupedBy.append(app)
            }
            if let app = appsPagos {
                self.appsGroupedBy.append(app)
            }
            
            self.activityIndicatorView.stopAnimating()
            self.collectionView.reloadData()
        }
        
    }
    
//    func returnFeatured() {
//
//        AppService.shared.returnFeatured { (apps, err) in
//
//            if let err = err {
//                print(err)
//            }
//
//            if let apps = apps {
//                DispatchQueue.main.async {
//                    self.appsFeatured = apps
//                    self.collectionView.reloadData()
//                }
//            }
//        }
//
//    }
//
//    func returnGroupsOfApps(type: String) {
//
//        AppService.shared.returnGroupOfApps(type: type) { (apps, err) in
//
//            if let err = err {
//                print(err)
//            }
//
//            if let apps = apps {
//                DispatchQueue.main.async {
//                    self.appsGroupedBy.append(apps)
//                    self.collectionView.reloadData()
//                }
//            }
//        }
//
//    }
    
}
