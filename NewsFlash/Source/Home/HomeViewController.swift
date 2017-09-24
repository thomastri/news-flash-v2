//
//  HomeViewController.swift
//  NewsFlash
//
//  Created by Thomas Le on 9/23/17.
//  Copyright © 2017 Thomas Le. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper
import Kingfisher
import SwiftWebVC

typealias JSONDict = [String : Any]

class HomeViewController : UIViewController {
    
    // converts homeView from UIView to HomeView
    var homeView : HomeView { return self.view as! HomeView }
    var articles : Array<Article> = []
    
    override func loadView() {
        self.view = HomeView()
    }
    
    override func viewDidLoad() {
        title = "News Flash!"
        
        setupTableView()
        
        let params = [
            "source" : "ign",
            "apiKey" : "b6ad5635af024cfc918e7d5cff6674bb",
            "sortBy" : "top" // or "latest"
        ]
        
        Alamofire.request("https://newsapi.org/v1/articles", parameters: params, encoding: URLEncoding(), headers: nil).responseJSON { response in
            
            if let responseJSON = response.result.value as? JSONDict {
                if let articleArray = responseJSON["articles"] as? Array<JSONDict> {
                    for articleData in articleArray {
                        
                        // if the articleData does not work, move onto the next
                        guard let article = Mapper<Article>().map(JSON: articleData) else { continue }
                        self.articles.append(article)
                    }
                }
            }
            
            // reload tables after request
            self.homeView.tableView.reloadData()
            
        }
    }
    
    func setupTableView() {
        
        // optimizes table to use our cell class
        // forCellReuseIdentifier allows us to reuse cells as we scroll to preserve memory
        homeView.tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: NewsCell.kCellIdentifier)
        
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
    }
    
}

extension HomeViewController : UITableViewDataSource {
    
    // number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    // controls the cell view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.kCellIdentifier, for: indexPath) as! NewsCell
        let article = articles[indexPath.row]
        
        cell.articleTitle.text = article.title
        if let url = URL(string : article.imageURL) {
            cell.thumbnailView.kf.setImage(with: url)
        }
        
        return cell
    }
    
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let article = articles[indexPath.row]
        
        // Opens in default broswer
//        if let url = URL(string: article.url) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
        
        let webVC = SwiftWebVC(urlString: article.url)
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    // each row size
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
}

