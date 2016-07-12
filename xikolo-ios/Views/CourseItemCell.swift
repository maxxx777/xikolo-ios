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
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var progressView: UILabel!

    func configure(courseItem: CourseItem) {
        titleView.text = courseItem.title
        readStateView.backgroundColor = UIColor.greenColor()
    }

}
