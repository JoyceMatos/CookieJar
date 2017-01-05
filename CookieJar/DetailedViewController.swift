//
//  DetailedViewController.swift
//  CookieJar
//
//  Created by Joyce Matos on 12/29/16.
//  Copyright © 2016 Joyce Matos. All rights reserved.
//

import UIKit
import MapKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var venueTypeLabel: UILabel!
    @IBOutlet weak var venueLocationLabel: UILabel!
    @IBOutlet weak var venuePhoneLabel: UILabel!
    @IBOutlet weak var venueLinkLabel: UILabel!
    
    @IBOutlet weak var addPhotoButton: UIButton!
    
    var annotation: MKPointAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let selectedAnnotation = annotation else { return }
        
        venueNameLabel.text = selectedAnnotation.title
        
        
        
        print("--------\(selectedAnnotation.title)--------")
        // Do any additional setup after loading the view.
    }
    
    


}
