//
//  buttonBorderViewController.swift
//  tabBarApplication
//
//  Created by Muhammed Siddiqui on 2024-05-17.
//

import UIKit

//MARK: Class
class buttonBorderViewController: UIViewController {

    
    //MARK: OUTLETS
    @IBOutlet weak var showAlertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forButtonBorder()

        // Do any additional setup after loading the view.
    }
    //MARK: FUNC FOR BORDER BUTTON
    func forButtonBorder(){
        showAlertButton.layer.borderColor = UIColor.systemCyan.cgColor
    }

    //MARK: Func for alert
    @IBAction func alertButton(_ sender: Any) {
        let alert = UIAlertController(title: "Alert Button Tapped", message: "Finally you are in Second View Tab", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler:nil))
        alert.addAction(UIAlertAction(title: "Cancel", style:.destructive, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
