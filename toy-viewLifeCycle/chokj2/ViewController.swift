//
//  ViewController.swift
//  chokj2
//
//  Created by 조경진 on 18/03/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    @IBAction func touchUpSetButton(_ sender: UIButton){
        UserInformation.shared.name = nameField.text
        UserInformation.shared.age = ageField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    print("ViewController의 view가 메모리에 로드 됨")
    }

    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        print("view의 화면에 보여질 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        print("view의 화면에 보여짐")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view의 화면에 사라질 예정")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view의 화면에 사라짐")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("뷰 컨트롤러의 뷰가 서브뷰를 레이아웃 하려함")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("뷰 컨트롤러의 뷰가 서브뷰를 레이아웃 함")
    }
    
}

