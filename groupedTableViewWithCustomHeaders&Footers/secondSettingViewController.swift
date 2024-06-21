//
//  secondSettingViewController.swift
//  groupedTableViewWithCustomHeaders&Footers
//
//  Created by Muhammed Siddiqui on 2024-03-26.
//

import UIKit

class secondSettingViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mainHeading: Array = ["Settings", "","", "", "",""]
    
    var eachRowsData: Array = [[""],["Screen Time", "Action Button"],["General", "Accessibility", "Privacy & Security"],["Password"],["Safari", "News", "Translate", "Maps", "Shortcuts","Health", "Siri & Search","Photos","Games Center"], ["Developer"]]
    var imgArray:  Array = [[""],["screenTimePicture.jpeg","actionButtonPicture.png"],["general.png","accessibilityIcon.png","privacy&Security.png"],["passwordImage.png"],["safariImage.png","newsImage.png","translateImage.png","mapsIcon.png","shortcutImage.png","healthImage.png","siri&Search.png","photosImage.png","gameCenter.png"], ["developerImage.png"]]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainHeading.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return eachRowsData[section].count
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .clear
        
        let mainHeadignlbl = UILabel(frame: CGRect(x: 20, y:8 , width: tableView.frame.width, height: 40))
        mainHeadignlbl.text = "\(mainHeading[section])"
        mainHeadignlbl.font = .boldSystemFont(ofSize: 30)
        mainHeadignlbl.textColor = .black
        headerView.addSubview(mainHeadignlbl)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? customClassViewTable {
                cell.signinInfo.text = "Sign In to your iPhone"
                cell.descriptionInfo.text = "Set up iCloud, the App store and more"
                return cell
            }
        }
        else if indexPath.section == 1 {
            if let secondCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? secondCustomClassViewTable {
                secondCell.screenTimeInfo.text = "\(eachRowsData[indexPath.section][indexPath.row])"
                secondCell.screenTimePic.image = UIImage(named: imgArray[indexPath.section][indexPath.row])
                secondCell.accessoryType = .disclosureIndicator
                return secondCell
            }

        }else if indexPath.section == 2{
            if let thirdCell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as? thirdCellcustomViewCell{
                thirdCell.General.text = "\(eachRowsData[indexPath.section][indexPath.row])"
                thirdCell.generalImage.image = UIImage(named: imgArray[indexPath.section][indexPath.row])
                thirdCell.accessoryType = .disclosureIndicator
                return thirdCell
            }
        }
        else if indexPath.section == 3 {
            if let fourthCell =  tableView.dequeueReusableCell(withIdentifier: "fourthCell", for: indexPath) as? fourthCellCustomClass{
                fourthCell.fourthRowsData.text = "\(eachRowsData[indexPath.section][indexPath.row])"
                fourthCell.passwordImage.image = UIImage(named: imgArray[indexPath.section][indexPath.row])
                fourthCell.accessoryType = .detailDisclosureButton
                return fourthCell
            }
        }else if indexPath.section ==  4 {
            if let fifthCell = tableView.dequeueReusableCell(withIdentifier: "fifthCell", for: indexPath) as? fifthCellCustom {
                fifthCell.fifthRowsData.text = "\(eachRowsData[indexPath.section][indexPath.row])"
                fifthCell.safariImage.image = UIImage(named: imgArray[indexPath.section][indexPath.row])
                fifthCell.accessoryType = .disclosureIndicator
                return fifthCell
            }
        }else if indexPath.section == 5{
            if let sixthCell = tableView.dequeueReusableCell(withIdentifier: "sixthCell", for: indexPath) as? sixthCellCustom {
                sixthCell.sixthRowsData.text = "\(eachRowsData[indexPath.section][indexPath.row])"
                sixthCell.developerImage.image = UIImage(named:imgArray[indexPath.section][indexPath.row])
                sixthCell.accessoryType = .disclosureIndicator
                return sixthCell
            }
        }
            else{
                return UITableViewCell()
            }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? fifthCellCustom {
            cell.fifthRowsData.text = "\(eachRowsData[indexPath.section][indexPath.row])"
            let initialStoryBoard =  UIStoryboard(name: "Main", bundle: nil)
            if let heartViewController = initialStoryBoard.instantiateViewController(identifier: "heartViewController") as? heartViewController {
                heartViewController.receiveValue = "\(eachRowsData[indexPath.section][indexPath.row])"
                self.navigationController?.pushViewController(heartViewController, animated: true)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

class customClassViewTable: UITableViewCell{
    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var signinInfo: UILabel!

    @IBOutlet weak var descriptionInfo: UILabel!
    
}

class secondCustomClassViewTable: UITableViewCell {
    
    @IBOutlet weak var screenTimePic: UIImageView!

    @IBOutlet weak var screenTimeInfo: UILabel!
    
}

class thirdCellcustomViewCell: UITableViewCell{
    
    @IBOutlet weak var General: UILabel!
    
    @IBOutlet weak var generalImage: UIImageView!
    
}

class fourthCellCustomClass: UITableViewCell{
    
    @IBOutlet weak var passwordImage: UIImageView!
    
    @IBOutlet weak var fourthRowsData: UILabel!
    
}

class fifthCellCustom: UITableViewCell {
    
    @IBOutlet weak var fifthRowsData: UILabel!

    @IBOutlet weak var safariImage: UIImageView!
    
}

class sixthCellCustom: UITableViewCell {
    
    @IBOutlet weak var sixthRowsData: UILabel!

    @IBOutlet weak var developerImage: UIImageView!
    
}

