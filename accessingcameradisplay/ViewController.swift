//
//  ViewController.swift
//  accessingcameradisplay
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Anika. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    // this is an object where we can access to store our photos/take photos within the class ImagePickerController


    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        //tells our obj that any info(photos) is going to go back to this class (self)
        //self just refers to the class that obj is in
    }
    
    
    @IBAction func takeSelfieTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        //this allows us to open our camera
        
        present(imagePicker, animated: true, completion: nil)
        //present is a built in function in apple that allows us to access our cam info
        //animation allows for a smooth transition if set to true
        //completion means that we exit out after we pick our photo
    }
    
    
    @IBAction func photoLibraryTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
        //this accesses our photo lib. and saves a photo of choice to our class! and when its done it quits
    }
    
    @IBOutlet weak var newImage: UIImageView!
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //the selected pic will replace the stock photo in our image view w the following code
        if let selectedImage =
        info[UIImagePickerController.InfoKey.originalImage]
            as? UIImage {newImage.image = selectedImage}
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}

