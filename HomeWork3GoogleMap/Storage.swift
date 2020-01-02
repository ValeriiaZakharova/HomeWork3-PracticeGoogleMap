//
//  Storage.swift
//  HomeWork3GoogleMap
//
//  Created by Valeriia Zakharova on 27.12.2019.
//  Copyright © 2019 Valeriia Zakharova. All rights reserved.
//

// Storage with users

import Foundation
import UIKit

class Storage {
    
    func makeUsers() -> [User] {
        
        let user1 = makeUser1()
        let user2 = makeUser2()
        let user3 = makeUser3()
        let user4 = makeUser4()
        let user5 = makeUser5()
        
        return [user1, user2, user3, user4, user5]
    }
    
    func makeUser1() -> User {
        
        let user1 = User(latitude: 50.200045, longitude: 30.355567)
        user1.name = "Pavel"
        user1.surName = "Kravtcov"
        user1.city = "Kharkiv"
        user1.age = 34
        user1.photo = UIImage(named: "user1")
        
        return user1
    }
    
    func makeUser2() -> User {
        
        let user2 = User(latitude: 50.000045, longitude: 30.875567)
        user2.name = "Aleksandra"
        user2.surName = "Chernyshova"
        user2.city = "Kharkiv"
        user2.age = 31
        user2.photo = UIImage(named: "user2")
        
        return user2
    }
    
    func makeUser3() -> User {
           
           let user3 = User(latitude: 50.600045, longitude: 30.775567)
           user3.name = "Harri"
           user3.surName = "Sokk"
           user3.city = "Kharkiv"
           user3.age = 35
           user3.photo = UIImage(named: "user3")
        
           return user3
       }
    
    func makeUser4() -> User {
              
              let user4 = User(latitude: 50.200045, longitude: 30.275567)
              user4.name = "Dariia"
              user4.surName = "Striy"
              user4.city = "Kharkiv"
              user4.age = 26
              user4.photo = UIImage(named: "user4")
        
              return user4
          }
    
    func makeUser5() -> User {
        
        let user5 = User(latitude: 50.500045, longitude: 30.675567)
        user5.name = "Sasha"
        user5.surName = "Popova"
        user5.city = "Kharkiv"
        user5.age = 32
        user5.photo = UIImage(named: "user5")
        
        return user5
    }
}


