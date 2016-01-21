//
//  RecordCell.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/21.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class RecordCell: UITableViewCell {

    var timeLabel: UILabel!
//    var userLabel: UILabel!
    var deviceLabel: UILabel!
    
    
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
        self.setUpLabels()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpLabels()
    }
    
    func setUpLabels() {
    
        timeLabel = UILabel()
        self.addSubview(timeLabel)
        
        timeLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(10)
            make.centerY.equalTo(self.snp_centerY).offset(0)
        }
        
        deviceLabel = UILabel()
        self.addSubview(deviceLabel)
        
        deviceLabel.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(self).offset(-10)
            make.centerY.equalTo(self.snp_centerY).offset(0)
        }
        
    }

}
