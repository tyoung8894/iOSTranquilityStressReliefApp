//
//  ManagePageViewController.swift
//  Tranquility
//
//  Created by Mark Malburg on 11/28/16.
//  Copyright © 2016 Mark Malburg. All rights reserved.
//


// Controller for page scrolling. Some code taken from https://www.raywenderlich.com/122139/uiscrollview-tutorial
import UIKit

class ManagePageViewController: UIPageViewController {
    var photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
    var currentIndex: Int!
    
   /* override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        // 1
        if let viewController = viewPhotoCommentController(currentIndex ?? 0) {
            let viewControllers = [viewController]
            // 2
            setViewControllers(
                viewControllers,
                direction: .Forward,
                animated: false,
                completion: nil
            )
        }
    }
    
    func viewPhotoCommentController(index: Int) -> PhotoCommentViewController? {
        if let storyboard = storyboard,
            page = storyboard.instantiateViewControllerWithIdentifier("PhotoCommentViewController")
                as? PhotoCommentViewController {
            page.photoName = photos[index]
            page.photoIndex = index
            return page
        }
        return nil
    }
 */
}
