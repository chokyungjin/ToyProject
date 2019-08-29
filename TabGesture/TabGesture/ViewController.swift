//
//  ViewController.swift
//  TabGesture
//
//  Created by 조경진 on 19/03/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {

    /*
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer =
        UITapGestureRecognizer()
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        
        /*
        let tapGesture: UITapGestureRecognizer =
            UITapGestureRecognizer(target: self, action:
                #selector(self.tapView(_:)))
        self.view.addGestureRecognizer(tapGesture)
        */
        // Do any additional setup after loading the view, typically from a nib.
    }

    func gestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer,
                           shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }

}

