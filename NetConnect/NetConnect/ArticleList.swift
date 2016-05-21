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
    
    
    //ライフサイクル------------------------------------------------------
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    
    //tableプロトコル------------------------------------------------------
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
            let article = articles[indexPath.row]
            cell.titleTextLabel.text = article["title"]!
            cell.componentTextLabel.text = article["userid"]!
            return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
        return cell.bounds.height
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedURL = articles[indexPath.row]["url"]!
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
//        let url = NSURL(string: selectedURL)!
//        if UIApplication.sharedApplication().canOpenURL(url){
//            UIApplication.sharedApplication().openURL(url)
//        }
        
        
        performSegueWithIdentifier("toWebSegue", sender: nil)
    }
    
    
    //ページ遷移------------------------------------------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toWebSegue"{
            let nextVC = segue.destinationViewController as! WebBrowseViewController
            nextVC.selectedUrl = self.selectedURL
        }
    }
    
    
    //記事を取得する------------------------------------------------------
    func getArticles(){
        Alamofire.request(.GET, "https://qiita.com/api/v2/items").responseJSON{responce -> Void in
            guard let object = responce.result.value else {return}
            let json = JSON(object)
            json.forEach{(_,json)-> Void in
                let article: [String : String?] = [
                    "title": json["title"].string,
                    "userid": json["user"]["id"].string,
                    "url": json["url"].string
                ]
                self.articles.append(article)
            }
            self.tableView.reloadData()
        }
        
    }
}

