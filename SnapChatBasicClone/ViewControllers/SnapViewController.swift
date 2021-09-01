//
//  SnapViewController.swift
//  SnapChatBasicClone
//
//  Created by Semih Kalaycı on 27.08.2021.
//

import UIKit

class SnapViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var selectedSnap : Snap?
    var selectedTime : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("time -------------------------- \(selectedTime)")
        if let time = selectedTime{
            timeLabel.text = "Time Left: \(time)"

        }
    }
    


}
