//
//  ViewController.swift
//  memberShip
//
//  Created by 조경진 on 19/03/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    func moveAction(_ sender: Any){
        
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        self.present(nextView, animated: true, completion: nil)
        
        // self.performSegue(withIdentifier: "Segue2", sender: nil)
    }
    
    
    @IBAction func touchUpSetButton(_ sender: UIButton){
        UserInformation.shared.ID = idField.text
        UserInformation.shared.Password = pwField.text
    }
    
    @IBAction func touchUpevent(_ sender: UIButton){
        if self.idField.text != "" && self.pwField.text != "" {
            
        }
        else {
            self.view.endEditing(false)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
}

