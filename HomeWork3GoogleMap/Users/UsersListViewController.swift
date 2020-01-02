//
//  UsersListViewController.swift
//  HomeWork3GoogleMap
//
//  Created by Valeriia Zakharova on 27.12.2019.
//  Copyright © 2019 Valeriia Zakharova. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        tableView.reloadData()
    }
}

extension UsersListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.updateCell(data: users[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboardMain = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboardMain.instantiateViewController(identifier: "UserInfoViewController") as! UserInfoViewController
        vc.user = users[indexPath.row]
        vc.locationButtonShown = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
