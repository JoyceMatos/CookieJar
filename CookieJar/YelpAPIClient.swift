//
//  YelpAPIClient.swift
//  CookieJar
//
//  Created by Joyce Matos on 12/19/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import Foundation

class YelpAPIClient {
    
    func getCookies(cookies: String, completion: @escaping ([String : Any]) -> Void) {
    
    let urlString = ""
    
    guard let url = URL(string: urlString) else { print("Invalid URL, leaving function"); return }
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: url) { (data, response, error) in
        
        guard let data = data else { print("error in data"); return }
        
        if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! [String : Any] {
            
            completion(responseJSON)
        
        }
        // missing task.resume
        
        }

    
    }
    


    
    
}



