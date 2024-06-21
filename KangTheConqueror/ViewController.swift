//
//  ViewController.swift
//  KangTheConqueror
//
//  Created by Muhammed Siddiqui on 2024-06-03.
//

//MARK: IMPORT Libraries
import UIKit

//MARK: CLASSES
class ViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var planetImg: UIImageView!
    
    @IBOutlet weak var kangImage: UIImageView!
    
    //OVERRIDE FUNCTION TO LOAD WHEN APP LOADS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Making obj for tap gesture on image
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapPressedGesture(sender:)))
        kangImage.addGestureRecognizer(tapGesture)
        
        //MARK: USING METHOD TO ENABLE USER INTERACTION
        kangImage.isUserInteractionEnabled = true
    }
    
    //MARK: Making method how it works
    @objc func tapPressedGesture(sender: UITapGestureRecognizer){
        if planetImg.image == UIImage(named: "earthPlanet") {
                planetImg.image = UIImage(named: "orangeEarthPic")
            } else if planetImg.image == UIImage(named: "orangeEarthPic") {
                planetImg.image = UIImage(named: "darkEarthPic")
            } else if planetImg.image == UIImage(named: "darkEarthPic") {
                planetImg.image = UIImage(named: "apoclypticPlanet")
            } else {
                planetImg.image = UIImage(named: "earthPlanet")
            }
    }
    
}

