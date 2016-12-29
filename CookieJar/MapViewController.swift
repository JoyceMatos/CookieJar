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
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        
            self.store.getCookieShopsFromAPI(lat: 40.746040, long: -73.982011) {
                
                
            }

        DispatchQueue.main.async {
            for shop in self.store.cookieShops {
                guard let title = shop.venueName else { print("no title"); return }
                guard let latitude = shop.latitude else { print("no lat"); return }
                guard let longitude = shop.longitude else { print("no long"); return }
                let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                let cookie = Annotation(title: title, coordinate: coordinate, info: "gsg", subtitle: title)
                self.mapView.addAnnotation(cookie)
            
          //      pinAnnotationView = MKPinAnnotationView(annotation: cookie, reuseIdentifier: "pin")
          //      mapView.addAnnotation(pinAnnotationView.annotation!)
            }
            
        }
        
    }

    
    // MARK: - Location Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
       guard let myPosition = locations.last?.coordinate else { print("leavin location"); return }
     
        locationManager.stopUpdatingLocation()
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(myPosition, span)
        mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
      
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    // MARK: - Annotation Delegate Methods
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "pin"
            
            if annotation.isKind(of: Annotation.self) {
                if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
                    
                    // Reuse Annotationview
                    
                    annotationView.annotation = annotation
                    return annotationView
                } else {
                    
                    // Create Annotation
                    
                    let annotationView = MKPinAnnotationView(annotation:annotation, reuseIdentifier:identifier)
                    annotationView.isEnabled = true
                    annotationView.canShowCallout = true
                    
                    // Here I create the button and add in accessoryView
                    
                    let btn = UIButton(type: .detailDisclosure)
                    annotationView.rightCalloutAccessoryView = btn
                    return annotationView
                }
            }
            return nil
        }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let venue = view.annotation as! Annotation
        let venueName = venue.title
        let venueInfo = venue.subtitle

        
        performSegue(withIdentifier: "detailView", sender: self)
   
    }
    
    
    
    

}
