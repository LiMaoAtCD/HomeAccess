//
//  DeviceCell.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/13.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit
import SnapKit
class DeviceCell: UITableViewCell {

    var nameLabel: UILabel!
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
        
        self.nameLabel = UILabel()
        self.addSubview(self.nameLabel)
        
        nameLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.snp_left).offset(10)
            make.right.equalTo(self.snp_right).offset(-10)
            make.centerY.equalTo(self.snp_centerY)
        }
        
    }

}
