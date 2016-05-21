//
//  ViewController.swift
//  AccessApiTest
//
//  Created by Taniguchi Keisuke on 2016/05/21.
//  Copyright © 2016年 Taniguchi Keisuke. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getArticle()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //Mark method
    
    func getArticle(){
        let APIKey: String = "apiキーを入れる"
        let urlString: String = "http://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid=\(APIKey)"
        let url = NSURL(string: urlString)!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url){
            (data,response,error) in
            guard let data = data else{return}
            let json = JSON(data: data)
            
            print(json)
        
        }
        task.resume()
    }
    
    func useAlamofire(){
        let APIKey: String = "apiキーを入れる"
        let urlString: String = "http://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid=\(APIKey)"
        Alamofire.request(.GET, urlString).responseJSON{
            response in
            guard let object = response.result.value else{return}
            let json = JSON(object)
            print(json)
        }
    }

}

