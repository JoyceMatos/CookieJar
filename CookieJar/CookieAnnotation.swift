//
//  CookieAnnotation.swift
//  CookieJar
//
//  Created by Joyce Matos on 12/28/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import Foundation
import UIKit
import MapKit

//class CookieAnnotation: MKPointAnnotation {
//    
//    var pinImage: String?
//    
//    
//    
//    
//    
//    
//    
//}

class Cookie: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
