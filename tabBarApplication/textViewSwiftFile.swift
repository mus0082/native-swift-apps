//
//  textViewSwiftFile.swift
//  tabBarApplication
//
//  Created by Muhammed Siddiqui on 2024-05-18.
//

import UIKit
// MARK: Class
class textViewSwiftFile: UIViewController {
    //MARK: OUTLETS
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    //MARK: Override Func
    override func viewDidLoad() {
        super.viewDidLoad()
        borderButton()
        // Do any additional setup after loading the view.
    }
    // MARK: Func border
    func borderButton() {
        submitButton.layer.borderColor = UIColor.systemIndigo.cgColor
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
