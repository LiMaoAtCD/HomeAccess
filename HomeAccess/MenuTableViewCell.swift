//
//  MenuTableViewCell.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/19.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
