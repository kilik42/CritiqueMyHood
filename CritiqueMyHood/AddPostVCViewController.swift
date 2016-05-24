//
//  AddPostVCViewController.swift
//  CritiqueMyHood
//
//  Created by marvin evins on 5/11/16.
//  Copyright © 2016 marvin evins. All rights reserved.
//

import UIKit

class AddPostVCViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var postImage: UIImageView!
    
    @IBOutlet var titleField: UITextField!
    
    @IBOutlet var descriptionField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }

  
    @IBAction func addPicButtonPressd(sender: UIButton!) {
        
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func makePostButtonPressed(sender: AnyObject) {
        
        
        if let title = titleField.text, let desc = descriptionField.text, let img = postImage.image{
            
            let post = Post(imagePath: "", title: title, description: desc)
            
            DataService.instance.addPost(post)
            
            
        }
    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImage.image = image
    }
}



//27:48
