//
//  SecondViewController.swift
//  chokj2
//
//  Created by 조경진 on 18/03/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Second ViewController의 view가 메모리에 로드 됨")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = UserInformation.shared.name
        self.ageLabel.text = UserInformation.shared.age
        
        print("Second view의 화면에 보여질 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        print("Second view의 화면에 보여짐")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Second view의 화면에 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Second view의 화면에 사라짐")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("Second 뷰 컨트롤러의 뷰가 서브뷰를 레이아웃 하려함")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("Second 뷰 컨트롤러의 뷰가 서브뷰를 레이아웃 함")
    }
    
    
    @IBAction func popToPrev(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dissmissModal(){
        self.dismiss(animated: true, completion: nil)
         
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
