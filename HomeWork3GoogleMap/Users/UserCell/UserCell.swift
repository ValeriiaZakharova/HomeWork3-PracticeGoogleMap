//
//  UserCell.swift
//  HomeWork3GoogleMap
//
//  Created by Valeriia Zakharova on 27.12.2019.
//  Copyright © 2019 Valeriia Zakharova. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var usersPhoto: UIImageView!
    @IBOutlet weak var usersName: UILabel!
    @IBOutlet weak var usersSurName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
}

extension UserCell {
    
    func updateCell(data: User){
        
        if let photo = data.photo {
            usersPhoto.image = photo
        }
        if let name = data.name {
            usersName.text = name
        }
        if let surName = data.surName {
            usersSurName.text = surName
        }
    }
}
