//
//  SecondViewController.swift
//  memberShip
//
//  Created by 조경진 on 19/03/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate {
   
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var imageView: UIImageView?
    
    @IBAction func touchUpSetButton(_ sender: UIButton){
        UserInformation.shared.ID = idField.text
        UserInformation.shared.Password = passwordField.text
      }
   
    func moveAction(_ sender: Any){
        /*
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "ThirdViewController")
        self.present(nextView, animated: true, completion: nil)
        */
        self.performSegue(withIdentifier: "Segue2", sender: nil)
    }
    
    
    @IBAction func touchUpevent(_ sender: UIButton){
        if self.idField.text != "" && self.passwordField.text != "" {
            moveAction(nextButton)
        }
        else {
            self.view.endEditing(false)
        }
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        
        self.present(self.imagePicker, animated: true, completion: nil)

    }
    
    
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
        // Do any additional setup after loading the view, typically from a nib.
       
        
        
    
    }
    
    }



