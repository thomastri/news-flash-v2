//
//  HomeView.swift
//  NewsFlash
//
//  Created by Thomas Le on 9/23/17.
//  Copyright © 2017 Thomas Le. All rights reserved.
//
import Foundation
import UIKit
import SnapKit

class HomeView : UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: layout
    
    func setupLayout() {
        
        // snaps constraints == parent view
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
