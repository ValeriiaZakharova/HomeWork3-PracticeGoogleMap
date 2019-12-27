//
//  UserProfile.swift
//  HomeWork3GoogleMap
//
//  Created by Valeriia Zakharova on 27.12.2019.
//  Copyright © 2019 Valeriia Zakharova. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var name: String?
    var surName: String?
    var age: Int?
    var city: String?
    var photo: UIImage?
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
