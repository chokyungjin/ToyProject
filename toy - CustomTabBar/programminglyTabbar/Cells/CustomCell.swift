//
//  CustomCell.swift
//  programminglyTabbar
//
//  Created by 조경진 on 2020/01/14.
//  Copyright © 2020 조경진. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    // 상단 탭바에 주어지는 label
    // TabBarItem 역할
    var label: UILabel = {
        let label = UILabel()
        label.text = "Tab"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //isSelected override 도 알아두면 좋은듯!
    override var isSelected: Bool {
        didSet{
          //  print("Changed")
            self.label.textColor = isSelected ? .black : .lightGray
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
