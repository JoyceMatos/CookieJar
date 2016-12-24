//
//  MapViewController.swift
//  CookieJar
//
//  Created by Joyce Matos on 12/19/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
//    var latitude = Double()
//    var longitude = Double()
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
//        guard let latitude = locationManager.location?.coordinate.latitude else { print("no latitude"); return }
//        guard let longitude = locationManager.location?.coordinate.longitude else { print("no longitude"); return }
//
//        print(latitude)
//        print(longitude)
        
        // Do any additional setup after loading the view.
        
        FourSquareAPIClient.getCookies(lat: 40.7, long: -74) { (cookies) in
            
            print(cookies)
            
        }
        
    }

    
    // MARK: - Location Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { print("leavin location"); return }
        
        let center = CLLocationCoordinate2D(latitude: (location.coordinate.latitude), longitude: (location.coordinate.longitude))
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
     
        mapView.setRegion(region, animated: true)
        
        locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }

    
}
