//
//  NewsCell.swift
//  NewsFlash
//
//  Created by Thomas Le on 9/24/17.
//  Copyright © 2017 Thomas Le. All rights reserved.
//

import Foundation
import UIKit

class NewsCell : UITableViewCell {
    
    static let kCellIdentifier = "news-cell"
    
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    
    class func instanceFromXib() -> UITableViewCell {
        return UINib(nibName: "NewsCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NewsCell
    }
}
