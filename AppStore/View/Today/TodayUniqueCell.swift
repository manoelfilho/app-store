//
//  TodayUniqueCell.swift
//  AppStore
//
//  Created by Manoel Filho on 09/02/21.
//

import UIKit

class TodayUniqueCell: UITableViewCell {
    
    var todayApp: TodayApp?
    
    let descriptionLabel: UILabel = {
        
        let label = UILabel()
        
        let textAttribute = NSMutableAttributedString(
            string: "Lorem ipsun ",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]
        )
        
        textAttribute.append(NSMutableAttributedString(
            string: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi commodo volutpat urna vel varius. Donec efficitur dignissim eros ac ullamcorper. Nulla facilisi. Aenean vel rhoncus augue. Sed sed maximus dolor. Nullam suscipit nulla eu enim porttitor, eu dictum ipsum porta. Nulla lacinia, erat quis lobortis aliquet, tortor felis dignissim est, id malesuada odio nisi et leo. Mauris nec fringilla orci. Quisque fermentum nisi vel felis rhoncus, non viverra sem malesuada.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]
        ))
        
        textAttribute.append(NSAttributedString(
            string: "\n\nDe onde ele vem",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]
        ))
        
        textAttribute.append(NSMutableAttributedString(
            string: " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi commodo volutpat urna vel varius. Donec efficitur dignissim eros ac ullamcorper. Nulla facilisi. Aenean vel rhoncus augue. Sed sed maximus dolor. Nullam suscipit nulla eu enim porttitor, eu dictum ipsum porta. Nulla lacinia, erat quis lobortis aliquet, tortor felis dignissim est, id malesuada odio nisi et leo. Mauris nec fringilla orci. Quisque fermentum nisi vel felis rhoncus, non viverra sem malesuada.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]
        ))
        
        label.attributedText = textAttribute
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
        
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descriptionLabel)
        descriptionLabel.preencherSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
}
