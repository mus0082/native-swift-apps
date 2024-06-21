//
//  ViewController.swift
//  CollectionViewWithDynamic Cells
//
//  Created by Muhammed Siddiqui on 2024-04-19.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

//MARK: OUTLETS
    @IBOutlet weak var forDynamicCollectionView: UICollectionView!
    
//MARK: VARIABLES
    
    var textForDescription: [String] = ["Physically, Thanos stands head and shoulders above the average human or humanoid, with powerful muscles, a broad face, and a purple-hued skintone. He often wears a protective suit of armor and his strength is such that he has been physically able to battle—and defeat—the likes of the Hulk","Not known to use much in the way of personal weapons, the one extremely notable artifact he keeps with him is the Infinity Gauntlet.","Made from Uru metal on Nidavellir by Eitri, under duress from Thanos, the Infinity Gauntlet enables its wearer to harness the power of each Infinity Stone added to it. Once it holds all six stones, it becomes the most powerful item in the universe.","Thanks to his actions, the list of those who consider Thanos an enemy is vast, though he has gained a few particularly notable adversaries."]
    
//MARK: func number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textForDescription.count
    }
    
//MARK: func cell for item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dynamicCell", for: indexPath) as? dynamicCellForDisplay {
            cell.descriptionTextArray.text = "\(textForDescription[indexPath.item])"
            cell.forButtonTrigger.tag = indexPath.item
     
            if cell.forButtonTrigger.tag == 0{
                cell.forButtonTrigger.setImage(UIImage(systemName: "atom"), for: .normal)
                cell.forButtonTrigger.tintColor = .systemTeal
            }else if cell.forButtonTrigger.tag == 1{
                cell.forButtonTrigger.setTitle("Thanos", for:.highlighted)
                cell.forButtonTrigger.setTitleColor(.systemBlue, for: .highlighted)
            }else if cell.forButtonTrigger.tag == 2 {
                cell.forButtonTrigger.setTitleColor(.red, for: .selected)
                cell.forButtonTrigger.setTitle("Selected", for: .selected)
            }else{
                    cell.forButtonTrigger.backgroundColor = .lightGray
                    cell.forButtonTrigger.titleColor(for: .normal)
                }
            cell.forButtonTrigger.addTarget(self, action:#selector(whenPressedAlertWillShowPrint(_:)), for: .touchUpInside)
            cell.borderColorBtn()
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
    
    //MARK: BUTTON FUNC ACTION
    @IBAction func whenPressedAlertWillShowPrint(_ sender: UIButton) {
        sender.isHighlighted = true
        sender.isSelected = true
        print("The button is pressed: \(sender.tag)")
        let actionSheet = UIAlertController(title: "Gaunlet Activated", message: "Thanos Coming!!!!", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Let Him Come", style: .default, handler: { UIAlertAction in print("Let him come index number: \(sender.tag)")}))
        self.present(actionSheet, animated: true)
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
// MARK: CUSTOM CLASS
class dynamicCellForDisplay: UICollectionViewCell{
    
    @IBOutlet weak var descriptionTextArray: UILabel!
    
    @IBOutlet weak var forButtonTrigger: UIButton!
    
    func borderColorBtn(){
        forButtonTrigger.layer.borderColor = UIColor.white.cgColor
    }
    
}

