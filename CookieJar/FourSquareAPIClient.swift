//
//  FourSquareAPIClient.swift
//  CookieJar
//
//  Created by Joyce Matos on 12/22/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import Foundation

class FourSquareAPIClient {
    
    class func getCookies(lat: Double, long: Double, completion: @escaping ([String : Any]) -> Void) {
        
        let fourSquare = FourSquareCredentials()
        
        let urlString = "https://api.foursquare.com/v2/venues/search?ll=\(lat),\(long)&query=cookies&client_id=\(fourSquare.clientID)&client_secret=\(fourSquare.clientSecret)&v=20161222"
        
        guard let url = URL(string: urlString) else { print("Invalid URL, leaving function"); return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { print("error in data"); return }
            
            if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! [String : Any] {
                
                completion(responseJSON)
                
            }
            
        }
    task.resume()
        
    }
    
    
}
