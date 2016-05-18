//
//  ParseFeed.swift
//  NetConnect
//
//  Created by Taniguchi Keisuke on 2016/05/18.
//  Copyright © 2016年 Taniguchi Keisuke. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import HTMLReader

class ParseFeed{
    
    func parse(url: String, completion: (([JSON]?, NSError?)->Void)){
        var url = NSURL(string: url)
        Alamofire.request(.GET, url!, parameters: nil, encoding: .JSON).responseJSON{request->Void in
            
        }
    }
}