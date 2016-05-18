//
//  CustomCell.swift
//  NetConnect
//
//  Created by Taniguchi Keisuke on 2016/05/18.
//  Copyright © 2016年 Taniguchi Keisuke. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var componentTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
