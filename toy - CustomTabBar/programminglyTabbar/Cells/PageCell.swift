//
//  PageCell.swift
//  programminglyTabbar
//
//  Created by 조경진 on 2020/01/14.
//  Copyright © 2020 조경진. All rights reserved.
//

import UIKit

//컨테이너 뷰가 될 컬렉션 뷰 셀
class PageCell: UICollectionViewCell {

    var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(label)
        self.backgroundColor = .white
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
