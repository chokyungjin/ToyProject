//
//  ThirdViewController.swift
//  memberShip
//
//  Created by 조경진 on 20/03/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var previous: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var phoneLabel: UITextField!
    
    @IBOutlet weak var birthField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    
    
    @IBAction func touchUpSetButton(_ sender: UIButton){
        UserInformation.shared.Birth = birthField.text
        UserInformation.shared.Phone = phoneField.text
    }
   
    
    func moveAction(_ sender: Any){
            self.performSegue(withIdentifier: "Segue1", sender: nil)
    }
    @IBAction func touchUpevent(_ sender: UIButton){
        if self.phoneLabel.text != "" && self.dateLabel.text != "" {
            moveAction(joinButton)
        }
        else {
            self.view.endEditing(false)
        }
    }
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
       // formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        formatter.dateStyle = .medium
        // formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        //print("value changed")
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        self.dateLabel.text = dateString
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
    }
    

  

}
