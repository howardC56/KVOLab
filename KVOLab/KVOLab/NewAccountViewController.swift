//
//  ViewController.swift
//  KVOLab
//
//  Created by Howard Chang on 4/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class NewAccount: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var balanceTextField: UITextField!
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text, let balance = balanceTextField.text else { return }
        let new = User(name: name, balance: Double(balance) ?? 0)
        Accounts.main.users.append(new)
        nameTextField.text = ""
        balanceTextField.text = ""
        nameTextField.resignFirstResponder()
        balanceTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

