//
//  CookieShop.swift
//  CookieJar
//
//  Created by Joyce Matos on 12/23/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import Foundation

class CookieShop {
    
    var venueName: String
    var contact: String
    var address: [String]
    var latitude: Double
    var longitude: Double
    var distance: Double?
    var type: String
    var fourSquareURL: String
    
    init(fourSquareDictionary: [String : Any]) {
        
        let fsDictionary = fourSquareDictionary["response"] as! [String : Any]
        let venueInfo = fsDictionary["venue"] as! [String : Any]
        let venueContact = venueInfo["contact"] as! [String : Any]
        let location = venueInfo["location"] as! [String : Any]
        let categories = venueInfo["categories"] as! [String : Any]
        let venueID = venueInfo["id"] as! String
        
        self.venueName = venueInfo["name"] as! String
        self.contact = venueContact["formattedPhone"] as! String
        self.address = venueInfo["formattedAddress"] as! [String]
        self.latitude = location["lat"] as! Double
        self.longitude = location["lng"] as! Double
        self.type = categories["name"] as! String
        self.fourSquareURL = "http://foursquare.com/v/\(venueID)"
        
        
    }
    
    
    
}
