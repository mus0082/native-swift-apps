//
//  sliderView.swift
//  tabBarApplication
//
//  Created by Muhammed Siddiqui on 2024-05-18.
//

import UIKit

//MARK: class
class sliderView: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var theValueDisplay: UILabel!
    
    //MARK: OVERRIDE Func
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func gettingValueSlider(_ sender: UISlider) {
    
        theValueDisplay.text = "The value of the Slider: \(Int(sender.value))"
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
