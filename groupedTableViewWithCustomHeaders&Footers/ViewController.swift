//
//  ViewController.swift
//  groupedTableViewWithCustomHeaders&Footers
//
//  Created by Muhammed Siddiqui on 2024-03-24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var settingOptions: Array = ["Settings","General", "Display & Brightness", "Sound & Haptics", "Privacy", "Battery"]
    
    var rowsOptions: Array = [[""],["About", "Software Update", "Air Drop"],["Change Wallpaper", "Color", "Resolution"],["Volume","Select Ringtone", "Haptics"], ["Tracking","Location Services","Calenders","Bluetooth","Microphone"],["Lower Power Mode","Battery Health"]]
    
    var footerForEachSection: Array = ["","Get information about your iPhone", "You can make your screen dimmer or brighter (dimming the screen extends battery life)", "Haptic feedback is the vibration you can feel on supported models after you perform some actions, such as when you touch and hold any icon on the Home Screen.", "Minimize how much of your information is available to anyone but you, and you can adjust what information is shared and where you share it", "Understand iPhone performance and its relation to your battery."]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingOptions.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 0
        }else{
            return rowsOptions[section].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? customViewTable{
           cell.displayTitle.text = "\(rowsOptions[indexPath.section][indexPath.row])"
           return cell
        }
        return UITableViewCell()
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
             let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
         headerView.backgroundColor = .gray
             let headerLabel = UILabel(frame: CGRect(x:2, y: 10, width: tableView.frame.width, height: 30))
            headerLabel.text = "\(settingOptions[section])"
            headerLabel.textColor = .black
            headerLabel.font = UIFont.boldSystemFont(ofSize: 25)
            headerView.addSubview(headerLabel)
            return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            return .none
        }else{
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
            footerView.backgroundColor = .darkGray
            
            let footerLbl = UILabel(frame: CGRect(x: 10, y: 1, width: tableView.frame.width - 15, height: 45))
            footerLbl.text = "\(footerForEachSection[section])"
            footerLbl.textColor = .white
            footerLbl.numberOfLines = 0
            footerLbl.font = UIFont.systemFont(ofSize: 12)
            footerView.addSubview(footerLbl)
            return footerView
        }
    }

    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class customViewTable : UITableViewCell{
   
    @IBOutlet weak var displayTitle: UILabel!
    
    
}

