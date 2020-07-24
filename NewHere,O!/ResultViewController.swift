//
//  ResultViewController.swift
//  NewHere,O!
//
//  Created by GW_15 on 23/07/2020.
//  Copyright © 2020 GW_15. All rights reserved.
//

import UIKit
import MapKit

class Mypin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    
    
    
    init(late: CLLocationDegrees, longi: CLLocationDegrees) {
        coordinate = CLLocationCoordinate2D(latitude: late, longitude: longi)
    }
}




class ResultViewController: UIViewController {
    let result = Result(hours: 12, minutes: 43, seconds: 25, path: [Mypin(late: 37.619978, longi: 127.059746),
                                                                    Mypin(late: 37.619855, longi: 127.059545),
                                                                    Mypin(late: 37.620152, longi: 127.058746),
                                                                    Mypin(late: 37.620454, longi: 127.058961)])
    
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    let path = MKPointAnnotation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hourLabel.text = String(result.hours)
        minuteLabel.text = String(result.minutes)
        secondLabel.text = String(result.seconds)
        mapView.addAnnotations(result.path)
        
        
    }
}
