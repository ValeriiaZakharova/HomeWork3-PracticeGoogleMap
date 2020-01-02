//
//  UserInfoViewController.swift
//  HomeWork3GoogleMap
//
//  Created by Valeriia Zakharova on 27.12.2019.
//  Copyright © 2019 Valeriia Zakharova. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var usersPhoto: UIImageView!
    
    @IBOutlet weak var usersName: UILabel!
    @IBOutlet weak var usrsSurName: UILabel!
    @IBOutlet weak var usersAge: UILabel!
    @IBOutlet weak var usersCity: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    
    var user: User?
    var locationButtonShown: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        updateButton()
    }
    
    func updateData() {
        
        if let name = user?.name  {
            usersName.text = name
        }
        if let surName = user?.surName{
            usrsSurName.text = surName
        }
        if let age = user?.age {
            usersAge.text = String(age)
        }
        if let city = user?.city{
            usersCity.text = city
        }
        if let photo = user?.photo{
            usersPhoto.image = photo
        }
        
    }
    
    func updateButton() {
        locationButton.isHidden = !locationButtonShown
        
    }
    
    @IBAction func didTapGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: false)
        
    }
    
    @IBAction func didTapGoToMap(_ sender: Any) {
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboardMain.instantiateViewController(identifier: "ViewController") as! ViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapMakaCall(_ sender: Any) {
        
        
    }
    
    @IBAction func didTapSendSms(_ sender: Any) {
        
        
    }
    
    @IBAction func didTapSendEmail(_ sender: Any) {
        
        
    }
    
}
