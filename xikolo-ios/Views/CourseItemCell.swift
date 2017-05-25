//
//  CourseItemCell.swift
//  xikolo-ios
//
//  Created by Bjarne Sievers on 18.05.16.
//  Copyright © 2016 HPI. All rights reserved.
//

import UIKit
import NFDownloadButton

class CourseItemCell : UITableViewCell {

    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var readStateView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var downloadButton: NFDownloadButton!

    @IBAction func downloadButtonTrigger(_ sender: NFDownloadButton) {
        // here we should trigger the download and take care that we receive the download progress
        sender.downloadPercent = 1.0
    }
    
    func configure(_ courseItem: CourseItem) {
        readStateView.backgroundColor = Brand.TintColor
        titleView.text = courseItem.title

        if let iconName = courseItem.iconName {
            iconView.image = UIImage(named: "item-\(iconName)-28")
        }
        if courseItem.iconName == "video" {
            downloadButton.isHidden = false
            //downloadButton.downloadState = .willDownload
            //downloadButton.downloadPercent = 1
        }else{
            downloadButton.isHidden = true
        }
        readStateView.isHidden = courseItem.visited ?? true
    }
    

}
