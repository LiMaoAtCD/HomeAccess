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
        setUpTitle()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpTitle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpTitle()
    }
    
    func setUpTitle(){
        
        self.selectionStyle = UITableViewCellSelectionStyle.None

        titleLabel = UILabel()
        titleLabel.textColor = UIColor.darkGrayColor()
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont.boldSystemFontOfSize(30.0)
        self.addSubview(titleLabel)
        
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.snp_left).offset(20)
            make.centerY.equalTo(self.snp_centerY)
        }
    }
    

}
