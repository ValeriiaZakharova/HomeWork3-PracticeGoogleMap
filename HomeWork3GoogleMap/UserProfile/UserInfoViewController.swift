//
//  UserInfoViewController.swift
//  HomeWork3GoogleMap
//
//  Created by Valeriia Zakharova on 27.12.2019.
//  Copyright © 2019 Valeriia Zakharova. All rights reserved.
//

import UIKit
import MessageUI

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
        
        if let user1 = user {
            vc.longitude = user1.longitude
            vc.latitude = user1.latitude
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapMakaCall(_ sender: Any) {
        callPhone()
    }
    
    @IBAction func didTapSendSms(_ sender: Any) {
        sendSMSMessage()
    }
    
    @IBAction func didTapSendEmail(_ sender: Any) {
        sendEmail()
    }

}

extension UserInfoViewController {
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let email = MFMailComposeViewController()
            email.mailComposeDelegate = self
            email.setToRecipients(["zakh.valeriia@gmail.com"])
            email.setSubject("Just for Fun")
            email.setMessageBody("Hello there!", isHTML: true)
            present(email, animated: true)
        } else {
            
        }
    }
    
    func sendSMSMessage() {
        if MFMessageComposeViewController.canSendText() {
            let sms = MFMessageComposeViewController()
            sms.messageComposeDelegate = self
            sms.recipients = ["+380996849017"]
            sms.body = "Hello there. Where've you been?"
            present(sms, animated: true, completion: nil)
        }
    }
    func callPhone() {
        
        guard let number = URL(string: "tel://" + "+380996849017") else {
            return
        }
        
        UIApplication.shared.open(number)
    }
    
}
extension UserInfoViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .sent:
            print("Email sent")
        case .saved:
            print("Draft saved")
        case .cancelled:
            print("Email cancelled")
        case  .failed:
            print("Email failed")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

extension UserInfoViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .cancelled:
            debugPrint("SMS CANCELD")
        case .failed:
            debugPrint("SMS FAILED")
        case .sent:
            debugPrint("SMS SENT")
        @unknown default:
            fatalError()
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
}



