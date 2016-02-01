//
//  FeedViewController.swift
//  week1_lab-facebook
//
//  Created by Bobby Smith on 1/29/16.
//  Copyright © 2016 Bobby Smith. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var navView: UIImageView!
    var composeView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // grab image
        imageView = UIImageView(image: UIImage(named: "home_feed"))
        navView = UIImageView(image: UIImage(named: "nav"))
        composeView = UIImageView(image: UIImage(named: "compose"))
    

        imageView.frame = CGRect(x: 0, y: navView.frame.height + composeView.frame.height - 20, width: imageView.frame.size.width, height: imageView.frame.size.height)
        composeView.frame = CGRect(x:0, y: navView.frame.height - 20, width: composeView.frame.size.width, height: composeView.frame.size.height)
        
        // setup the scroll view
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = imageView.bounds.size


        // add the scrollview
        view.addSubview(scrollView)
        view.addSubview(navView)

        // add images to the scrollview
        scrollView.addSubview(imageView)
        scrollView.addSubview(composeView)
        

        // create the button and add it to scrollview
        let button = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(10, 230, 300, 370)
        button.backgroundColor = UIColor.clearColor()
        button.addTarget(self, action: Selector("detailsBtnClicked:"), forControlEvents: .TouchUpInside)
        scrollView.addSubview(button)
        
        // create the status/photo/checking buttons and add them to scrollview
        let statusButton = UIButton(type: UIButtonType.System) as UIButton
        statusButton.frame = CGRectMake(0, navView.frame.height - 20, 212/2, 92/2)
        statusButton.backgroundColor = UIColor.clearColor()
        statusButton.addTarget(self, action: Selector("statusBtnClicked:"), forControlEvents: .TouchUpInside)
        scrollView.addSubview(statusButton)

        let photoButton = UIButton(type: UIButtonType.System) as UIButton
        photoButton.frame = CGRectMake(statusButton.frame.width, navView.frame.height - 20, 212/2, 92/2)
        photoButton.backgroundColor = UIColor.clearColor()
        photoButton.addTarget(self, action: Selector("photoBtnClicked"), forControlEvents: .TouchUpInside)
        scrollView.addSubview(photoButton)

        
        let checkinButton = UIButton(type: UIButtonType.System) as UIButton
        checkinButton.frame = CGRectMake(statusButton.frame.width + photoButton.frame.width, navView.frame.height - 20, 212/2, 92/2)
        checkinButton.backgroundColor = UIColor.clearColor()
        checkinButton.addTarget(self, action: Selector("checkinBtnClicked:"), forControlEvents: .TouchUpInside)
        scrollView.addSubview(checkinButton)

        
    }

    func detailsBtnClicked(sender: UIButton!) {
        performSegueWithIdentifier("detailView", sender: self)
    }
    
    func statusBtnClicked(sender: UIButton!) {
        let controller = storyboard!.instantiateViewControllerWithIdentifier("statusVC")
        self.presentViewController(controller, animated: true, completion: nil)
    }

    func checkinBtnClicked(sender: UIButton!) {
        let controller = storyboard!.instantiateViewControllerWithIdentifier("checkinVC")
        self.presentViewController(controller, animated: true, completion: nil)
    }

    
    
    func photoBtnClicked() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var newImage: UIImage
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        
        // do something interesting here!
        print(newImage.size)
        
        dismissViewControllerAnimated(true, completion: nil)
    }


}
