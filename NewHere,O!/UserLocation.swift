//
//  UserLocation.swift
//  NewHere,O!
//
//  Created by GW_15 on 23/07/2020.
//  Copyright © 2020 GW_15. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class UserLocation: UIViewController, CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var mapView1: MKMapView!
    
    let manager = CLLocationManager()
    
    
    
    // MARK: Outlets
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    // MARK: - Variables
    var hours = 0
    var minutes = 0
    var seconds = 0
    
    // Timer
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            
            render(location)
            
        }
    }
    
    func render(_ location: CLLocation) {
        
        
        let coordinate = CLLocationCoordinate2D(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        
        mapView1.setRegion(region, animated: true)
        
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView1.addAnnotation(pin)
        
    }
    
    
    
    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pause(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        resetTimes()
    }
    
    func resetTimes() {
        hours = 0
        minutes = 0
        seconds = 0
        timer.invalidate()
        secondLabel.text = "00"
        minuteLabel.text = "00"
        hourLabel.text = "00"
        
    }
    
    @objc fileprivate func count() {
        seconds += 1
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        if minutes == 60 {
            minutes = 0
            seconds = 0
            hours += 1
        }
        
        if hours == 24 {
            resetTimes()
        }
        
        secondLabel.text = "\(seconds)"
        minuteLabel.text = minutes == 0 ? "00" : "\(minutes)"
        hourLabel.text = hours == 0 ? "00" : "\(hours)"
        
        
        func resetTimes() {
            hours = 0
            minutes = 0
            seconds = 0
            timer.invalidate()
            secondLabel.text = "00"
            minuteLabel.text = "00"
            hourLabel.text = "00"
            
            
        }
    }
    
}

