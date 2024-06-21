//
//  ViewController.swift
//  uiScrollViewWithCustomSlidesAndUIPageControl
//
//  Created by Muhammed Siddiqui on 2024-04-25.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{
 
    //MARK: OUTLETS
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var slideControl: UIPageControl!
    
    //MARK: VARIABLE
    var slideArray:[slidePractice] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slideArray = forSlideCreation()
        scrollViewControl()
        
        slideControl.numberOfPages = slideArray.count
        slideControl.currentPage = 2
    }
    


    //MARK: METHOD FOR MULTIPLE SLIDES
    func forSlideCreation() -> [slidePractice] {
        
        let slide1: slidePractice = Bundle.main.loadNibNamed("slidePractice", owner: self, options: nil)?.first as! slidePractice
        slide1.dynamicImage.image = UIImage(named: "nathanDrakePic")
        slide1.gameName.text = "Uncharted 4: A Thief's End"
        slide1.backgroundImage.image = UIImage(named: "unchartedBackgroundPicture")
        slide1.changeGameScreenShotBtn.tag = 0
        slide1.changeGameScreenShotBtn.addTarget(self, action:#selector(whenPressedTakeMetoNextScreen(_:)), for: .touchUpInside)
        
        let slide2: slidePractice = Bundle.main.loadNibNamed("slidePractice", owner: self, options: nil)?.first as! slidePractice
        slide2.dynamicImage.image = UIImage(named: "laraCroftPicture")
        slide2.gameName.text = "Shadow of the Tomb Raider"
        slide2.backgroundImage.image = UIImage(named: "tombRaiderBackgroundPicture")
        slide2.changeGameScreenShotBtn.tag = 1
        slide2.changeGameScreenShotBtn.addTarget(self, action:#selector(whenPressedTakeMetoNextScreen(_:)), for: .touchUpInside)
        
        let slide3: slidePractice = Bundle.main.loadNibNamed("slidePractice", owner: self, options: nil)?.first as! slidePractice
        slide3.dynamicImage.image = UIImage(named: "ellieLastOfUsPicture")
        slide3.backgroundImage.image = UIImage(named: "lastOfUsBackgroundPic")
        slide3.gameName.text =  "The Last of Us Part II"
        slide3.changeGameScreenShotBtn.tag = 2
        slide3.changeGameScreenShotBtn.addTarget(self, action:#selector(whenPressedTakeMetoNextScreen(_:)), for: .touchUpInside)
        
        let slide4: slidePractice = Bundle.main.loadNibNamed("slidePractice", owner: self, options: nil)?.first as! slidePractice
        slide4.dynamicImage.image = UIImage(named: "farcry4CharacterPic")
        slide4.gameName.text = "Far Cry 4"
        slide4.backgroundImage.image = UIImage(named: "farcry4BackgroundPic")
        slide4.changeGameScreenShotBtn.tag = 3
        slide4.changeGameScreenShotBtn.addTarget(self, action:#selector(whenPressedTakeMetoNextScreen(_:)), for: .touchUpInside)
        
        let slide5: slidePractice =  Bundle.main.loadNibNamed("slidePractice", owner: self, options: nil)?.first as! slidePractice
        slide5.dynamicImage.image = UIImage(named: "crysis3Character")
        slide5.gameName.text = "Crysis 3"
        slide5.backgroundImage.image = UIImage(named: "crysis3BackgroundPicture")
        slide5.changeGameScreenShotBtn.tag = 4
        slide5.changeGameScreenShotBtn.addTarget(self, action:#selector(whenPressedTakeMetoNextScreen(_:)), for: .touchUpInside)
        
        return [slide1, slide2, slide3, slide4, slide5]
    }
    

    
    @IBAction func whenPressedTakeMetoNextScreen(_ sender: UIButton) {
        print("this button is pressed: \(sender.tag)")
        scrollView.setContentOffset(CGPoint(x: view.frame.width * CGFloat(sender.tag + 1), y: 0 ), animated: true)
    }
    //content size func
    func scrollViewControl() {
        scrollView.contentSize =  CGSize(width: view.frame.width * CGFloat(slideArray.count), height: scrollView.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slideArray.count{
            slideArray[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            scrollView.addSubview(slideArray[i])

        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex =  round(scrollView.contentOffset.x/view.frame.width)
        slideControl.currentPage = Int(pageIndex)
    }

}

