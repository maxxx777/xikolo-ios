//
//  CourseListViewController.swift
//  xikolo-ios
//
//  Created by Arne Boockmeyer on 08/07/15.
//  Copyright © 2015 HPI. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class CourseListViewController : AbstractCourseListViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var numberOfItemsPerRow = 1

    deinit {
        self.collectionView?.emptyDataSetSource = nil
        self.collectionView?.emptyDataSetDelegate = nil
    }

    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            if UserProfileHelper.isLoggedIn() {
                courseDisplayMode = .enrolledOnly
            } else {
                sender.selectedSegmentIndex = 1
                performSegue(withIdentifier: "ShowLogin", sender: sender)
            }
        case 1:
            courseDisplayMode = UserProfileHelper.isLoggedIn() ? .explore : .all
        default:
            break
        }
        updateView()
    }

    override func viewDidLoad() {
        if !UserProfileHelper.isLoggedIn() {
            segmentedControl.selectedSegmentIndex = 1
            courseDisplayMode = .all
            updateView()
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        switch traitCollection.horizontalSizeClass {
        case .compact, .unspecified:
            numberOfItemsPerRow = 1
        case .regular:
            numberOfItemsPerRow = 2
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { context in
            // Force redraw
            self.collectionView!.performBatchUpdates(nil, completion: nil)
        }, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "ShowCourseContent"?:
                let vc = segue.destination as! CourseDecisionViewController
                let cell = sender as! CourseCell
                let indexPath = collectionView!.indexPath(for: cell)
                let course = resultsController.object(at: indexPath!) as! Course
                vc.course = course
            default:
                break
        }
    }

}

extension CourseListViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let blankSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfItemsPerRow - 1))
            let width = (collectionView.bounds.width - blankSpace) / CGFloat(numberOfItemsPerRow)
            return CGSize(width: width, height: width * 0.6)
    }

}
