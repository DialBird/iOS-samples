//
//  ViewController.swift
//  NetConnect
//
//  Created by Taniguchi Keisuke on 2016/05/17.
//  Copyright © 2016年 Taniguchi Keisuke. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ArticleList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var articles = [[String : String?]]()
    
    var selectedURL: String!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        
        let nib: UINib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "CustomCell")
        
        let nib2: UINib = UINib(nibName: "CustomCell2", bundle: nil)
        tableView.registerNib(nib2, forCellReuseIdentifier: "CustomCell2")
        
        getArticles()
    }

    //tableプロトコル
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let ranNum: Int = Int(arc4random_uniform(2))
//        if ranNum == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
            let article = articles[indexPath.row]
            cell.titleTextLabel.text = article["title"]!
            cell.componentTextLabel.text = article["userid"]!
            return cell
//        }else{
//            let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell2") as! CustomCell2
//            return cell
//        }
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
        return cell.bounds.height
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedURL = articles[indexPath.row]["url"]!
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    func getArticles(){
        Alamofire.request(.GET, "https://qiita.com/api/v2/items").responseJSON{responce -> Void in
            guard let object = responce.result.value else {return}
            let json = JSON(object)
            json.forEach{(_,json)-> Void in
                let article: [String : String?] = [
                    "title": json["title"].string,
                    "userid": json["user"]["id"].string
                ]
                self.articles.append(article)
            }
            self.tableView.reloadData()
        }
        
    }
}

