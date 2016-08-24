//
//  ViewController.swift
//  Map
//
//  Created by 李宝明 on 16/8/24.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude: CLLocationDegrees = 27.1
        let longtitude: CLLocationDegrees = 78.0
        
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "Taj Mahal"
        annotation.subtitle = "one day i will go there ..."
        
        annotation.coordinate = location
        
        map.addAnnotation(annotation)
        
        
        
        map.setRegion(region, animated: true)
        
        let uiLongPressGestureReconizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gesture:)))
    
        map.addGestureRecognizer(uiLongPressGestureReconizer)
    }


    func longPress(gesture: UILongPressGestureRecognizer){
        
        let touchPoint = gesture.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "new Place"
        annotation.subtitle = "maybe i go there too"
        
        map.addAnnotation(annotation)
    }
}

