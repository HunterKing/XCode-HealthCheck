//
//  PassportView.swift
//  
//
//  Created by Hunter King on 12/5/20.
//

import UIKit

class PassportView: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var passportTimeStamp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "EST")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "EEEE, MMM d yyyy, h:mm a"
        let strPassport = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "MM/d/YY"
        let strDateLabel = dateFormatter.string(from: date)
        
        dateLabel.text = strDateLabel
        passportTimeStamp.text = strPassport
        // Do any additional setup after loading the view.
    }
}
