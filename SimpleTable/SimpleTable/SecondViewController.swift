//
//  SecondViewController.swift
//  SimpleTable
//
//  Created by 조경진 on 24/03/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textToSet: String?
    @IBOutlet weak var textLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.textLabel.text = self.textToSet
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
