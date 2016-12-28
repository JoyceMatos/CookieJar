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
    var distance: Int?
    var type: String
    var fourSquareURL: String

    
    init(cookieDict: [String : Any]) {
        
        let venueName = cookieDict["name"] as! String
        let contact = cookieDict["contact"] as! [String : Any]
        let phoneNumber = contact["formattedPhone"] as! String
        let address = cookieDict["formatatedAddress"] as! [String]
        let latitude = cookieDict["lat"] as! Double
        let longitude = cookieDict["lng"] as! Double
        let distance = cookieDict["disance"] as! Int
        let type = cookieDict["type"] as! String
        let venueID = cookieDict["id"] as! String
        
        self.venueName = venueName
        self.contact = phoneNumber
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.distance = distance
        self.type = type
        self.fourSquareURL = "http://foursquare.com/v/\(venueID)"
        
    }
    
    
    
}
