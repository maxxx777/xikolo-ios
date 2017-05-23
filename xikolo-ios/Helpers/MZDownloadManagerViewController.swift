//
//  MZDownloadedViewController.swift
//  MZDownloadManager
//
//  Created by Muhammad Zeeshan on 23/10/2014.
//  Copyright (c) 2014 ideamakerz. All rights reserved.
//

import UIKit
import MZDownloadManager

class MZDownloadedViewController: UITableViewController {
    
    var downloadedFilesArray : [String] = []
    var selectedIndexPath    : IndexPath?
    var fileManger           : FileManager = FileManager.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        do {
            let contentOfDir: [String] = try FileManager.default.contentsOfDirectory(atPath: MZUtility.baseFilePath as String)
            downloadedFilesArray.append(contentsOf: contentOfDir)
            
            let index = downloadedFilesArray.index(of: ".DS_Store")
            if let index = index {
                downloadedFilesArray.remove(at: index)
            }
            
        } catch let error as NSError {
            print("Error while getting directory content \(error)")
        }
        
        NotificationCenter.default.addObserver(self, selector: NSSelectorFromString("downloadFinishedNotification:"), name: NSNotification.Name(rawValue: MZUtility.DownloadCompletedNotif as String), object: nil)
        
        //        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MZDownloadedViewController.downloadFinishedNotification(_:)), name: DownloadCompletedNotif as String, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - NSNotification Methods -
    
    func downloadFinishedNotification(_ notification : Notification) {
        let fileName : NSString = notification.object as! NSString
        downloadedFilesArray.append(fileName.lastPathComponent)
        tableView.reloadSections(IndexSet(integer: 0), with: UITableViewRowAnimation.fade)
    }
}

//MARK: UITableViewDataSource Handler Extension

extension MZDownloadedViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloadedFilesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier : NSString = "DownloadedFileCell"
        let cell : UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier as String, for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = downloadedFilesArray[(indexPath as NSIndexPath).row]
        
        return cell
    }
}

//MARK: UITableViewDelegate Handler Extension

extension MZDownloadedViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedIndexPath = indexPath
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let fileName : NSString = downloadedFilesArray[(indexPath as NSIndexPath).row] as NSString
        let fileURL  : URL = URL(fileURLWithPath: (MZUtility.baseFilePath as NSString).appendingPathComponent(fileName as String))
        
        do {
            try fileManger.removeItem(at: fileURL)
            downloadedFilesArray.remove(at: (indexPath as NSIndexPath).row)
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        } catch let error as NSError {
            debugPrint("Error while deleting file: \(error)")
        }
    }
}
