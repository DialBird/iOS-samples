//
//  NextViewController.swift
//  AccessApiTest
//
//  Created by Taniguchi Keisuke on 2016/05/21.
//  Copyright © 2016年 Taniguchi Keisuke. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var info: String?
    
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoLabel.text = info
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
