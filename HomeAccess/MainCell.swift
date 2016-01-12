//
//  MainCell.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/12.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
import SnapKit
class MainCell: UITableViewCell {

    var titleLabel: UILabel!
    var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubViews()

    }

    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        configureSubViews()
    }
    
    func configureSubViews() {
        
        titleLabel = UILabel()
        
        self.addSubview(titleLabel!)
        
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.snp_leftMargin)
            make.centerY.equalTo(self.snp_centerY)
        }
        
        contentLabel = UILabel()
        self.addSubview(contentLabel!)
        
        contentLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(titleLabel.snp_rightMargin)
            make.centerY.equalTo(self.snp_centerY)
            make.right.equalTo(self.snp_rightMargin).offset(-10).priority(1000)
        }
        

    }
}




