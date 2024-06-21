//
//  customerHeaderView.swift
//  customHeaderView&FooterView
//
//  Created by Muhammed Siddiqui on 2024-04-03.
//

import UIKit

class customerHeaderView: UITableViewHeaderFooterView {
    //MARK: - Outlets
    @IBOutlet weak var displayTitle: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    //MARK: - Variables
    
    static let headerIdentifier: String = String(describing: "customHeaderView")
    
    static var nib: UINib{
        return UINib(nibName: "customHeaderView", bundle: nil)
    }

}
