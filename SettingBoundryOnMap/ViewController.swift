//
//  ViewController.swift
//  SettingBoundryOnMap
//
//  Created by Muhammed Siddiqui on 2024-08-12.
//

//MARK: IMPORT FRAMEWORKS
import MapKit
import UIKit

//MARK: SUPER CLASS
class ViewController: UIViewController {
    
    //MARK: VARIABLES
    var mapView: MKMapView?
    //MARK: Setting region
    let sanfranciscoRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
  
    //MARK: OVERRIDEDX PROPERTY
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK: Instance MKMapView()
        mapView = MKMapView()//Creating object to use as an instance of Mkmapview
        //MARK: SET FRAME
        mapView = MKMapView(frame: view.bounds)// setting the map  effectively sets the map view to cover the entire view.
        view.addSubview(mapView ?? UIView())//Add the mapView to the view controller's view
        //MARK: Display Map
        mapView?.delegate = self
        //MARK: DISPLAY REGION
        setupRegion()
        coverArea()
    }
    //MARK: DISPLAY REGION
    func setupRegion(){
        mapView?.setRegion(sanfranciscoRegion, animated: true)
    }
    
    //MARK: POLYGONAREA
    func coverArea(){
        let coordinates = [
            CLLocationCoordinate2D(latitude: 37.810000, longitude: -122.520000),
            CLLocationCoordinate2D(latitude: 37.810000, longitude: -122.370000),
            CLLocationCoordinate2D(latitude: 37.700000, longitude: -122.370000),
            CLLocationCoordinate2D(latitude: 37.700000, longitude: -122.520000)
        ]
        //MARK:
        let polygon = MKPolygon(coordinates: coordinates, count: coordinates.count)//The code draws a custom shape (polygon) on the map using a series of points you define.
        mapView?.addOverlay(polygon)//The code draws a custom shape (polygon) on the map using a series of points you define.
    }
    
}
//MARK: map delegate
extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, rendererFor overlay: any MKOverlay) -> MKOverlayRenderer {
        if let polygonOverlay = overlay as? MKPolygon {// here I am checking the polygon type
            let renderrer = MKPolygonRenderer(polygon: polygonOverlay)// here I am renderring the polygon on map
            renderrer.fillColor = UIColor.systemBlue.withAlphaComponent(0.5) //setting the color of cover area
            renderrer.strokeColor = UIColor.systemTeal// setting the border color
            renderrer.lineWidth = 3 //setting the width of border
            
            return renderrer // lastly returning renderrer
        }
        return MKOverlayRenderer(overlay: overlay) //
    }
    
    //MARK: SETUP THE BOUNDREY
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let minLatitude: CLLocationDegrees = 37.0
        let maxLatitude: CLLocationDegrees = 38.0
        let maxLongitude: CLLocationDegrees = -123.0
        let minLongitude: CLLocationDegrees = -122.0
        
        let currentLatitude = mapView.region.center.latitude
        let currentLongitude = mapView.region.center.longitude
        
        if currentLatitude < minLatitude ||//OR CONDITION.
         currentLatitude >= maxLatitude ||
         currentLongitude >= maxLongitude ||
        currentLongitude < minLongitude {
            mapView.setRegion(sanfranciscoRegion, animated: true)
        }
    }
}

