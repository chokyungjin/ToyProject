//
//  UserInformation.swift
//  memberShip
//
//  Created by 조경진 on 20/03/2019.
//  Copyright © 2019 Cho. All rights reserved.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var ID: String?
    var Password: String?
    var Birth: String?
    var Phone: String?
}
