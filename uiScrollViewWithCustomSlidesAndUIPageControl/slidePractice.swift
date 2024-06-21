//
//  slidePractice.swift
//  uiScrollViewWithCustomSlidesAndUIPageControl
//
//  Created by Muhammed Siddiqui on 2024-04-25.
//

import UIKit

class slidePractice: UIView {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var gameName: UILabel!
    
    @IBOutlet weak var changeGameScreenShotBtn: UIButton!
    
    @IBOutlet weak var dynamicImage: UIImageView!
    
    func forBtnBorder(){
        changeGameScreenShotBtn.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        forBtnBorder()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
