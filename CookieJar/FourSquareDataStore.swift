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

        FourSquareAPIClient.getCookies(lat: lat, long: long) { (cookieShops) in

            for shop in cookieShops {
               
               var cookie = CookieShop(cookieDict: shop)
                cookieShops.append(cookie)
                
                print(cookie)
            }
        }
    }
    
}
