//
//  customerFooterView.swift
//  customHeaderView&FooterView
//
//  Created by Muhammed Siddiqui on 2024-04-03.
//

import UIKit

class customerFooterView: UITableViewHeaderFooterView {
 //MARK: - Outlets
    @IBOutlet weak var displayTextInFooter: UILabel!
//MARK: - Variables
    
    static let identifier: String = String(describing: "customFooterView")
    
    static var nib: UINib{
        return UINib(nibName: String(describing: "customFooterView"), bundle: nil)
        //return UINib(nibName: "customFooterView", bundle: nil)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

