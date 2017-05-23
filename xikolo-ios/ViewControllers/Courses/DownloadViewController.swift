//
//  DownloadViewController.swift
//  xikolo-ios
//
//  Created by Jan Renz on 23.05.17.
//  Copyright © 2017 HPI. All rights reserved.
//

import UIKit


class DownloadViewController : UIViewController {
    
    @IBOutlet var freeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        self.updateDiskStatus()
    }
    
    
    // MARK: update disk space status
    func updateDiskStatus() {

        freeLabel!.text = String(format:NSLocalizedString("Free %@", comment: ""), DiskStatus.freeDiskSpace)
        
        //var frame:CGRect = self.totalView!.frame
        //frame.size.width = CGFloat(Double(DiskStatus.usedDiskSpaceInBytes)/Double(DiskStatus.totalDiskSpaceInBytes)) * frame.size.width
        
        //diskUsedView = UIView(frame: frame)
        //!.backgroundColor = self.usedLabel.textColor
        //self.view!.addSubview(diskUsedView!)
    }
}
