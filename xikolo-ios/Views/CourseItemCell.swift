//
//  CourseItemCell.swift
//  xikolo-ios
//
//  Created by Bjarne Sievers on 18.05.16.
//  Copyright © 2016 HPI. All rights reserved.
//

import UIKit

class CourseItemCell : UITableViewCell {

    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var readStateView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var downloadButton: UIButton!

    func configure(_ courseItem: CourseItem) {
        readStateView.backgroundColor = Brand.TintColor
        titleView.text = courseItem.title

        if let iconName = courseItem.iconName {
            iconView.image = UIImage(named: "item-\(iconName)-28")
        }
        if courseItem.iconName == "video" {
            downloadButton.isHidden = false
        }else{
            downloadButton.isHidden = true
        }
        readStateView.isHidden = courseItem.visited ?? true
    }

}
