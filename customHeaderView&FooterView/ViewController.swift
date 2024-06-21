//
//  ViewController.swift
//  customHeaderView&FooterView
//
//  Created by Muhammed Siddiqui on 2024-04-03.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
    return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeaderView") as? customerHeaderView {
            headerView.displayTitle.text =  "Finally I got the Header"
          //  headerView.backgroundColor = .systemTeal
            return headerView
         
        }
        else{
          return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customFooterView") as? customerFooterView {
            footerView.displayTextInFooter.text = "here is the description of the footer that finally i got it but, i dont know that I used the right method?"
            return footerView
        }
        else{
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(customerHeaderView.nib, forHeaderFooterViewReuseIdentifier: "customHeaderView")
    
        tableView.register(customerFooterView.nib, forHeaderFooterViewReuseIdentifier: "customFooterView")
    }


}

