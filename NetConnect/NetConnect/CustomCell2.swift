//
//  CustomButton.swift
//  NetConnect
//
//  Created by Taniguchi Keisuke on 2016/05/18.
//  Copyright © 2016年 Taniguchi Keisuke. All rights reserved.
//

import UIKit

class CustomCell2: UITableViewCell {

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = UIColor.redColor()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.redColor()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
