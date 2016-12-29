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
    
    let store = FourSquareDataStore.sharedInstance
    
    var locationManager = CLLocationManager()
    var myPosition = CLLocationCoordinate2D()

    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
        
        store.getCookieShopsFromAPI(lat: 40.746040, long: -73.982011) {
        
        }
        
        DispatchQueue.main.async {
            for shop in self.store.cookieShops {
                let coordinate = CLLocationCoordinate2D(latitude: shop.latitude!, longitude: shop.longitude!)
                let cookie = Annotation(title: shop.venueName!, coordinate: coordinate, info: "gsg", subtitle: shop.venueName!)
                self.mapView.addAnnotation(cookie)
            }
        }
        
        
        
        
    }

    
    // MARK: - Location Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
       guard let myPosition = locations.last?.coordinate else { print("leavin location"); return }
        
        
////        guard let location = locations.last else { print("leavin location"); return }
////        
////        let center = CLLocationCoordinate2D(latitude: (location.coordinate.latitude), longitude: (location.coordinate.longitude))
////        
////        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
////        
////     
////        mapView.setRegion(region, animated: true)
////        
        locationManager.stopUpdatingLocation()
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(myPosition, span)
        mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
      
    }
    


    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }

    
}
