//
//  FourSquareDataStore.swift
//  CookieJar
//
//  Created by Joyce Matos on 12/23/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import Foundation

class FourSquareDataStore {

    static let sharedInstance = FourSquareDataStore()

    var cookieShops: [CookieShop] = []

    func getCookieShopsFromAPI(lat: Double, long: Double, completion: () -> Void) {

        self.cookieShops.removeAll()

        FourSquareAPIClient.getCookies(lat: lat, long: long) { (cookieVenues) in

            for shop in cookieVenues {
               
               var cookie = CookieShop(cookieDict: shop)
                self.cookieShops.append(cookie)
                
                print(cookie.latitude)
            }
        }
        
        completion()
    }
    
}
