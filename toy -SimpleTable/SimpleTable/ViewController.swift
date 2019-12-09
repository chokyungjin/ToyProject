//
//  ViewController.swift
//  SimpleTable
//
//  Created by 조경진 on 23/03/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    
    
    let korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    
    let english: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R",
                             "S","T","U","V","W","X","Y","Z"]
    
    var dates: [Date] = []
    
    let dataFormatter:  DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    let timeFormatter:  DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func touchUpAddButton(_ sender : UIButton){
        dates.append(Date())
        
        //self.tableView.reloadData()
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell =
            tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier,for: indexPath)
        
        if indexPath.section < 2 {
        let text: String = indexPath.section == 0 ? korean[indexPath.row] :
        english[indexPath.row]
        cell.textLabel?.text = text
            
            if indexPath.row == 1 {
                cell.backgroundColor = UIColor.red
            } else {
                cell.backgroundColor = UIColor.white
            }
            
            return cell
        }else{
            let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
            
           // cell.textLabel?.text = self.dataFormatter.string(from: self.dates[indexPath.row])
            cell.leftLabel.text = self.dataFormatter.string(from: self.dates[indexPath.row])
            cell.rightLabel.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2{
        return section == 0 ? "한글" : "영어"
        }
        return nil
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: SecondViewController =
            segue.destination as? SecondViewController else{
                return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else{
            return
        }
        nextViewController.textToSet = cell.textLabel?.text
    }

}

