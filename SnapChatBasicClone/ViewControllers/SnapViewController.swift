//
//  SnapViewController.swift
//  SnapChatBasicClone
//
//  Created by Semih Kalaycı on 27.08.2021.
//

import UIKit
import ImageSlideshow

class SnapViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var selectedSnap : Snap?
    var inputArray = [KingfisherSource]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        if let snaps = selectedSnap{
            timeLabel.text = "Time Left \(snaps.timeDifference)"
            for imageUrl in snaps.imageUrlArray{
                inputArray.append(KingfisherSource(urlString: imageUrl)!)
            }
            
            let imageSlideShow = ImageSlideshow(frame: CGRect(x: 10, y: 10, width: self.view.frame.width * 0.95, height: self.view.frame.height * 0.9))
            imageSlideShow.backgroundColor = UIColor.white
            // Fotoların altına hangi sıradaki fotoda olduğumuzu gösteren 3 nokta
            let pageIndicator = UIPageControl()
            pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
            pageIndicator.pageIndicatorTintColor = UIColor.black
            imageSlideShow.pageIndicator = pageIndicator
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
            imageSlideShow.setImageInputs(inputArray)
            self.view.addSubview(imageSlideShow)
            self.view.bringSubviewToFront(timeLabel) // time label i önde göster
        }
        
        
        
        
    }
    


}
