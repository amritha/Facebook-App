//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Amritha Prasad on 6/5/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    var image : UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var actionView: UIImageView!
   
    
    var scrollOriginalOffset : CGFloat!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        imageView.clipsToBounds = true
        imageView.image = image
        scrollView.delegate = self
        scrollView.contentSize = imageView.image!.size
        scrollOriginalOffset = scrollView.contentOffset.y
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var diffOffset = CGFloat(1.0)
        if CGFloat(scrollView.contentOffset.y) < scrollOriginalOffset{
        diffOffset = 80 / (CGFloat(CGFloat(scrollOriginalOffset) - CGFloat(scrollView.contentOffset.y)))
        }
        self.view.alpha = CGFloat(diffOffset)
        doneButton.alpha = CGFloat(diffOffset)
        actionView.alpha = CGFloat(diffOffset)
       
        println("\(self.view.alpha)")
        
        
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y < -50
        {

        dismissViewControllerAnimated(true, completion: nil)
            UIView.animateWithDuration(0.2, animations: {
            self.imageView.alpha = 0
                self.view.alpha = 0
            })
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageView
    }
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
