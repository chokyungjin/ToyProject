//
//  ViewController.swift
//  experiment
//
//  Created by 조경진 on 21/03/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate {

    @IBOutlet var imageView : UIImageView!
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        
        self.present(self.imagePicker, animated: true, completion: nil)
        
    }

    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage:UIImage =  info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView?.image = originalImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraintX: NSLayoutConstraint
        constraintX = imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        var constraintY: NSLayoutConstraint
        constraintY = imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        constraintY.isActive = true
        constraintX.isActive = true
        // Do any additional setup after loading the view, typically from a nib.
    }


}

