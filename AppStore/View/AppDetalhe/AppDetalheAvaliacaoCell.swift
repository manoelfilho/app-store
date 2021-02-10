//
//  AppDetalheAvaliacaoCell.swift
//  AppStore
//
//  Created by Manoel Filho on 03/02/21.
//

import UIKit

class AppDetalheAvaliacaoCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var app:App? {
        didSet {
            if app != nil {
                self.collectionView.reloadData()
            }
        }
    }
    
    let cellID = "cellID"
    
    let titleLabel: UILabel = .textBold(text: "Avaliação e opiniões", fontSize: 24)
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ComentarioCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        addSubview(titleLabel)
        titleLabel.preencher(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 0)
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

//MARK:Delegate Methods
extension AppDetalheAvaliacaoCell {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.app?.comentarios?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ComentarioCell
        if let comment = self.app?.comentarios?[indexPath.item] {
            cell.comment = comment
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
    }
    
}

class ComentarioCell: UICollectionViewCell {
    
    var comment: AppComment? {
        didSet{
            if let comment = comment {
                titleLabel.text = comment.titulo
                comentarioLabel.text = comment.descricao
                avaliacaoImageView.image = UIImage(named: "avaliacao-\(comment.avaliacao)")
            }
        }
    }
    
    let titleLabel: UILabel = .textBold(text: "Muito bom", fontSize: 16)
    let comentarioLabel: UILabel = .textLabel(text: "Recomendo este app", fontSize: 16, numberOfLines: 0)
    
    let avaliacaoImageView: UIImageView = {
        let image = UIImageView()
        image.size(size: .init(width: 120, height: 24))
        image.contentMode = .scaleAspectFit
        return image
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        layer.cornerRadius = 12
        layer.masksToBounds = true
        clipsToBounds = true
        
        avaliacaoImageView.image = UIImage(named: "avaliacao-4")
        
        let headerStackView = UIStackView(arrangedSubviews: [
            titleLabel,
            avaliacaoImageView
        ])
        
        let comentarioStackView = UIStackView(arrangedSubviews: [
            comentarioLabel
        ])
        comentarioStackView.alignment = .top
        
        let stackView = UIStackView(arrangedSubviews: [
            headerStackView,
            comentarioStackView
        ])
        
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.preencherSuperview( padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        stackView.spacing = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
