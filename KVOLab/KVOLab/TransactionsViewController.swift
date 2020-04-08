//
//  TransactionsViewController.swift
//  KVOLab
//
//  Created by Howard Chang on 4/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func withdrawButtonPressed(_ sender: UIButton) {
        guard let amount = amountTextLabel.text else { return }
        user.balance -= Double(amount) ?? 0
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func depositButtonPressed(_ sender: UIButton) {
        guard let amount = amountTextLabel.text else { return }
              user.balance += Double(amount) ?? 0
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var amountTextLabel: UITextField!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.name
    }
    
    
    

}
