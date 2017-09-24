//
//  HomeViewController.swift
//  NewsFlash
//
//  Created by Thomas Le on 9/23/17.
//  Copyright © 2017 Thomas Le. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController : UIViewController {
    
    // converts homeView from UIView to HomeView
    var homeView : HomeView {
        return self.view as! HomeView
    }
    
    override func loadView() {
        self.view = HomeView()
    }
    
    override func viewDidLoad() {
        title = "News Flash!"
        
        setupTableView()
    }
    
    func setupTableView() {
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
    }
    
}

extension HomeViewController : UITableViewDataSource {
    
    // number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "Cell \(indexPath.row)"
        
        return cell
    }
    
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // indexPath.row will return the int of each row you tapped
    }
    
    // each row size
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
}

