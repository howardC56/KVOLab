//
//  User.swift
//  KVOLab
//
//  Created by Howard Chang on 4/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation

@objc class User: NSObject {
       let name: String
       @objc dynamic var balance: Double
       
    init(name: String, balance: Double) {
           self.name = name
           self.balance = balance
       }
   
}

@objc class Accounts: NSObject {
    @objc dynamic var users = [User]()
    static let main = Accounts()
    private override init() {}
}
