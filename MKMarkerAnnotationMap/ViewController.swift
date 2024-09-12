//
//  ViewController.swift
//  MKMarkerAnnotationMap
//
//  Created by Muhammed Siddiqui on 2024-07-10.
//
//MARK: Frameworks
import UIKit
import MapKit

//MARK: SUPER CLASS
class ViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: DEFAULT OVERRIDE METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: CREATING COORDIANATE OBJECT
        let coordinateSanfrancisco = CLLocationCoordinate2D(latitude:  37.7749, longitude:-122.4194)
        let coordinateLosAngeles = CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)
        let coordinateNewYork = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)
        
        //MARK: CREATED REGION
        let regionSanFrancisco = MKCoordinateRegion(center: coordinateSanfrancisco, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(regionSanFrancisco, animated: true)
        
        let regionLosAngeles = MKCoordinateRegion(center: coordinateLosAngeles, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(regionLosAngeles, animated: true)
       
        let regionNewYork = MKCoordinateRegion(center: coordinateNewYork, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(regionNewYork, animated: true)
        //MARK: On map MARKER
        let annotations = [
            CustomAnnotation(coordinate: coordinateSanfrancisco, title: "San Francisco", subtitle: "California", image: UIImage(named: "sf"), btn: UIButton(type: .custom)),
            CustomAnnotation(coordinate: coordinateLosAngeles, title: "Los Angeles", subtitle: "California", image: UIImage(named: "la"), btn: UIButton(type: .custom)),
            CustomAnnotation(coordinate: coordinateNewYork, title:"New York"  , subtitle: "New York", image: UIImage(named: "nyc"), btn: UIButton(type: .custom))
        ]
        mapView.addAnnotations(annotations)
        
        mapView.register(CustomMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: CustomMarkerAnnotationView.identifier)

    }
}

//MARK: ADDING MKMapViewDelegate for using the callout method
extension ViewController: MKMapViewDelegate{
    //MARK: DESIGN FOR POP UP
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        guard let customAnnotation  = annotation as? CustomAnnotation else{
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: CustomMarkerAnnotationView.identifier) as? CustomMarkerAnnotationView
        if annotationView == nil {
            annotationView = CustomMarkerAnnotationView(annotation: customAnnotation, reuseIdentifier: CustomMarkerAnnotationView.identifier)
        }else{
            annotationView?.annotation = customAnnotation
        }
        return annotationView
    }
    
    //MARK: Info button tap
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation as? CustomAnnotation else {
            return
        }
        
        
        let alert = UIAlertController(title: annotation.title, message: annotation.subtitle, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        if annotation.title == "San Francisco"{
            alert.message = "Welcome to San Francisco"
        }else if annotation.title == "Los Angeles"{
            alert.message = "Welcome to Los Angeles"
        }else{
            alert.message = "Welcome to New York"
        }
        present(alert, animated: true)
    }
}


//MARK: DETAILS On MARKER
class CustomAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var image: UIImage?
    var btn: UIButton?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, image: UIImage?, btn: UIButton?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.btn = btn
    }
}

//MARK: MAKING MARKER POP
class CustomMarkerAnnotationView: MKMarkerAnnotationView{
    static let identifier = "CustomMarkerAnnotation"
    
    override var annotation: MKAnnotation? {
        
        //MARK: When you want to set value
        willSet{
            guard let customAnnotation = newValue as? CustomAnnotation else {
                return
            }
            canShowCallout = true
            markerTintColor = .blue
            calloutOffset = CGPoint(x: 0, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            glyphText = String(customAnnotation.title?.prefix(1) ?? "C")
            if let image = customAnnotation.image{
                let imageView = UIImageView(image: image)
                imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
                leftCalloutAccessoryView = imageView
            }
            if let navButton = customAnnotation.btn {
                navButton.frame = CGRect(x: 25, y: 0, width: 50, height: 30) // Adjust position and size as needed
                navButton.setTitle("More Info", for: .normal)
                navButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
                navButton.backgroundColor = .gray
                navButton.setTitleColor(.black, for: .normal)
                navButton.addTarget(self, action:#selector(handleButton(_:)), for: .touchUpInside)// WHEN ADD CUSTOM BUTTON YOU WANT TO PERFORM ACTION ADDTARGET IN BUTTON
                leftCalloutAccessoryView?.addSubview(navButton) // ADD ANORHER SUBVIEW FOR BUTTON INSIDE CALLOUTVIEW
            }
        }
    }
    
    @objc func handleButton(_ sender: UIButton) {
            let initialStoryBoard =  UIStoryboard(name: "Main", bundle: nil)
            if let detailView =  initialStoryBoard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController{
                detailView.navigationController?.pushViewController(detailView, animated: true)
            
        }

    }
}

