//
//  SearchCell.swift
//  AppStore
//
//  Created by Manoel Filho on 29/01/21.
//

import UIKit
import SDWebImage

class SearchCell: UITableViewCell {
    
    var app: App! {
        didSet{
            titleLabel.text = app.nome
            brandLabel.text = app.empresa
            
            //add image with SDWebImage
            iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
            
            //add the screenshots
            if let screenshorUrls = app.screenshotUrls {
                
                if screenshorUrls.count > 0 {
                    self.screenShotImage1View.sd_setImage(with: URL(string: screenshorUrls[0]), completed: nil)
                }
                
                if screenshorUrls.count > 1 {
                    self.screenShotImage2View.sd_setImage(with: URL(string: screenshorUrls[1]), completed: nil)
                }
                
                if screenshorUrls.count > 2 {
                    self.screenShotImage3View.sd_setImage(with: URL(string: screenshorUrls[2]), completed: nil)
                }
                
            }
            
            //add a icon without dependency SDWebImage
            /*
            DispatchQueue.main.async {
                if let url = URL(string: self.app.iconeUrl){
                    do {
                        let data = try Data(contentsOf: url)
                        self.iconeImageView.image = UIImage(data: data)
                    }catch let err{
                        print(err)
                    }
                }
            }
            */
            
        }
    }
    
    let iconeImageView: UIImageView = .iconImageView()
    let titleLabel:UILabel = .textLabel(text: "App Name", fontSize: 18, numberOfLines: 2)
    let brandLabel:UILabel = .textLabel(text: "Brand Name", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    let screenShotImage1View: UIImageView = .screenShotImageView()
    let screenShotImage2View: UIImageView = .screenShotImageView()
    let screenShotImage3View: UIImageView = .screenShotImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // MARK: - titleBrandStackView
        let titleBrandStackView = UIStackView(arrangedSubviews: [titleLabel, brandLabel])
        titleBrandStackView.spacing = 8
        titleBrandStackView.axis = .vertical
        
        // MARK: - headerStackView
        let headerStackView = UIStackView(arrangedSubviews: [iconeImageView, titleBrandStackView, getButton])
        headerStackView.spacing = 12
        headerStackView.alignment = .center
        
        // MARK: - screenShotSatckView
        let screenShotSatckView = UIStackView(arrangedSubviews: [screenShotImage1View, screenShotImage2View, screenShotImage3View])
        screenShotSatckView.spacing = 12
        screenShotSatckView.distribution = .fillEqually
        
        let globalStackView = UIStackView(arrangedSubviews: [headerStackView, screenShotSatckView])
        
        globalStackView.spacing = 16
        globalStackView.axis = .vertical
        
        
        addSubview(globalStackView)
        
        globalStackView.preencherSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
}
