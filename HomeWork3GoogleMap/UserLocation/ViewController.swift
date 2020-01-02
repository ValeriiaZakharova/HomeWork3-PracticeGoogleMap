//
//  ViewController.swift
//  HomeWork3GoogleMap
//
//  Created by Valeriia Zakharova on 27.12.2019.
//  Copyright © 2019 Valeriia Zakharova. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class MapModel {
    let user: User
    let marker: GMSMarker
    
    init(user: User, marker: GMSMarker) {
        self.user = user
        self.marker = marker
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var imgeButton: UIImageView!
    
//    var users: [User] = []
//    var markers: [GMSMarker] = []
    
    var models: [MapModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        models = makeModels()
        
        setupCamera()
        mapView.delegate = self
    }
    
    @IBAction func didTapGoToUsersList(_ sender: Any) {
        
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboardMain.instantiateViewController(identifier: "UsersListViewController") as! UsersListViewController
        vc.users = Storage().makeUsers()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController {
    
    func makeModels() -> [MapModel] {
        var models: [MapModel] = []
        
        let users = Storage().makeUsers()
        
        for user in users {
            if let name = user.name {
                let coordinates = CLLocationCoordinate2D(latitude: user.latitude, longitude: user.longitude)
                let marker = GMSMarker(position: coordinates)
                marker.title = name
                marker.map = mapView
                
                let model = MapModel(user: user, marker: marker)
                models.append(model)
            }
        }
        return models
    }
    
    func setupCamera() {
        for model in models {
            let camera = GMSCameraPosition.camera(withLatitude: model.user.latitude, longitude: model.user.longitude, zoom: 9.2)
            mapView.camera = camera
        }
    }
}

extension ViewController: GMSMapViewDelegate {
    
    func openUserInfo(user: User) {
        
        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboardMain.instantiateViewController(identifier: "UserInfoViewController") as! UserInfoViewController
           
        vc.user = user
        vc.locationButtonShown = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        for model in models {
            if marker == model.marker {
                openUserInfo(user: model.user)
            }
        }
        return true
    }
}

