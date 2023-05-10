//
//  ViewController.swift
//
//
//  Created by Fatjona Hoti on 14.4.23.
//

import UIKit
import MapKit
import CoreLocation


class LocationDetailsViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    //MARK: IBOutlets
    @IBOutlet weak var wheretoaddress: UITextField!
    @IBOutlet weak var mapKit: MKMapView!
    
    let locationManager = CLLocationManager()
    let userAnnotation = MKPointAnnotation()
    let destination = MKPointAnnotation()
    var citiesarray: [MKAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        mapKit.delegate = self
        addCities()
        setRegionForCities()
        self.mapKit.showAnnotations(self.mapKit.annotations, animated: true)
    }
    //MARK: Functions
    func clearMap() {
        mapKit.removeOverlays(self.mapKit.overlays)
        mapKit.removeAnnotation(destination)
    }
    func setupLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocatiion = manager.location?.coordinate
        userAnnotation.coordinate = userLocatiion ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        userAnnotation.title = "User"
        mapKit.addAnnotation(userAnnotation)
        mapKit.showAnnotations(self.mapKit.annotations, animated: true)
    }
    func getLocationFromAddress(address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let placemarks = placemarks, placemarks.count > 0 {
                if let coordinate = placemarks.first?.location?.coordinate {
                    
                    self.destination.coordinate = coordinate
                    self.destination.title = address
                    self.mapKit.addAnnotation(self.destination)
                    self.mapKit.showAnnotations(self.mapKit.annotations, animated: true)
                    self.drawPath(source: self.userAnnotation, destination: self.destination)
                    self.clearMap()
                }
            }
            if error != nil{
                let alert = UIAlertController(title: "MapView", message: "Address not found", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }
        }
    }
    func drawPath(source: MKPointAnnotation, destination: MKPointAnnotation) {
        let sourcePlacemark = MKPlacemark(coordinate: source.coordinate)
        let destinationPlacemark = MKPlacemark(coordinate: destination.coordinate)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        let direction = MKDirections(request: directionRequest)
        direction.calculate { response, error in
            if let calculationResponse = response {
                let routes = calculationResponse.routes
                
                for route in routes {
                    print("route = \(route.name), distance = \(route.distance / 1000)km")
                    self.mapKit.addOverlay(route.polyline, level: .aboveRoads)
                }
            }
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .red
        renderer.lineWidth = 3
        return renderer
    }
    func setupLocationMenager() {
        locationManager.requestWhenInUseAuthorization()
        if locationManager.authorizationStatus == .authorizedWhenInUse{
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
    }
    func addLondonAnnotation() {
        let londonPoint = MKPointAnnotation()
        londonPoint.title = "London"
        londonPoint.coordinate = CLLocationCoordinate2D(latitude: 51.50630746148096, longitude: -0.12358154288030161)
        mapKit.addAnnotation(londonPoint)
        let region = MKCoordinateRegion(center: londonPoint.coordinate, latitudinalMeters: 3000, longitudinalMeters: 3000)
        mapKit.region = region
    }
    func addCities() {
        let london = MKPointAnnotation()
        london.title = "London"
        london.coordinate = CLLocationCoordinate2D(latitude: 51.50630746148096, longitude: -0.12358154288030161)
        citiesarray.append(london)
        
        let paris = MKPointAnnotation()
        paris.title = "Paris"
        paris.coordinate = CLLocationCoordinate2D(latitude: 48.862000979204986, longitude: 2.3469837008047496)
        citiesarray.append(paris)
        
        let berlin = MKPointAnnotation()
        berlin.title = "Berlin"
        berlin.coordinate = CLLocationCoordinate2D(latitude:52.5133779862148, longitude:13.424548504555005 )
        citiesarray.append(berlin)
        
        let amsterdam = MKPointAnnotation()
        amsterdam.title = "Amsterdam"
        amsterdam.coordinate = CLLocationCoordinate2D(latitude:52.364483338215116, longitude:4.909965786993491 )
        citiesarray.append(amsterdam)
        
        let vienna = MKPointAnnotation()
        vienna.title = "Vienna"
        vienna.coordinate = CLLocationCoordinate2D(latitude:48.21243491352518, longitude:16.393636768635737 )
        citiesarray.append(vienna)
        
        let budapest = MKPointAnnotation()
        budapest.title = "Budapest"
        budapest.coordinate = CLLocationCoordinate2D(latitude:47.49965443710346, longitude:19.042398978052823 )
        
        citiesarray.append(budapest)
        mapKit.addAnnotations(citiesarray)
    }
    func setRegionForCities() {
        var centralLatitude: Double = 0.0
        var centralLongitude: Double = 0.0
        for i in 0...citiesarray.count - 1{
            centralLatitude += citiesarray[i].coordinate.latitude
            centralLongitude += citiesarray[i].coordinate.longitude
        }
        centralLatitude = centralLatitude / Double(citiesarray.count)
        centralLongitude = centralLongitude / Double(citiesarray.count)
        let centralCoodinate =  CLLocationCoordinate2D(latitude: centralLatitude, longitude: centralLongitude)
        let centralRegion = MKCoordinateRegion(center: centralCoodinate, latitudinalMeters: 150000, longitudinalMeters: 150000)
        mapKit.region = centralRegion
        
    }
    //MARK: IBActions
    @IBAction func goButtonPressed(_ sender: Any) {
        getLocationFromAddress(address: wheretoaddress.text ?? "Prishtina")
    }
}
