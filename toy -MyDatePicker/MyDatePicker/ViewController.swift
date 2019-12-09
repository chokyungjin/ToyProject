//
//  ViewController.swift
//  MyDatePicker
//
//  Created by 조경진 on 19/03/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        //formatter.dateStyle = .medium
       // formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        print("value changed")
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        self.dateLabel.text = dateString
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     /*
        self.datePicker.addTarget(self, action:
            #selector(self.didDatePickerValueChanged(_:)), for:
            UIControlEvents.valueChanged)
        // Do any additional setup after loading the view, typically from a nib.
 */
 }
 

}

