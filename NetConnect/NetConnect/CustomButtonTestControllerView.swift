//
//  CustomButtonTestControllerView.swift
//  NetConnect
//
//  Created by Taniguchi Keisuke on 2016/05/18.
//  Copyright © 2016年 Taniguchi Keisuke. All rights reserved.
//

import UIKit

class CustomButtonTestControllerView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CustomButton", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! UIButton
        nib.frame = CGRectMake(0, 0, nib.bounds.width, nib.bounds.height)
        
        view.addSubview(nib)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
