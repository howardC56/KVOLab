//
//  UsersViewController.swift
//  KVOLab
//
//  Created by Howard Chang on 4/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var userObserver: NSKeyValueObservation?
    var accountsObserver: NSKeyValueObservation?
    var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeAccounts()
        tableView.dataSource = self
        tableView.delegate = self
        users = Accounts.main.users
    }
    
    private func observeAccounts() {
        accountsObserver = Accounts.main.observe(\.users, options: [.old, .new], changeHandler: { [weak self] (accounts, change) in
            guard let accounts = change.newValue else { return }
            self?.users = accounts
        })
    }
    
    private func observeUser(user: User) {
        userObserver = user.observe(\.balance, options: [.old, .new], changeHandler: {  (user, change) in
            guard let balance = change.newValue else { return }
            Accounts.main.users = self.users
        })
    }
    
    deinit {
           userObserver?.invalidate()
       }

}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = "$\(user.balance)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "TransactionsViewController") as? TransactionsViewController else { fatalError() }
        let selected = users[indexPath.row]
        observeUser(user: selected)
        vc.user = selected
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
