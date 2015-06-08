//
//  ImageTransition.swift
//  Facebook
//
//  Created by Amritha Prasad on 6/5/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    var feedViewController : NewsFeedViewController!
   
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        
        //var newsFeedViewController = fromViewController as! NewsFeedViewController
        var photoViewController = toViewController as! PhotoViewController
        var destinationImageFrame = photoViewController.imageView.frame
        
        photoViewController.imageView.frame = feedViewController.selectedImageView.frame
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(0.2, animations: {
            toViewController.view.alpha = 1
                photoViewController.imageView.frame = destinationImageFrame
            
            }){ (finished: Bool) -> Void in
                self.finish()
        }

    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
}
