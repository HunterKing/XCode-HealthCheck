//
//  ContactController.swift
//  FinalProject
//
//  Created by Hunter King on 12/5/20.
//

import UIKit

class ContactController: UIViewController {
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkPassed(_ sender: UIButton) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "EST")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "EEEE, MMM d yyyy, h:mm a"
        let passportStr = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "MM/d/YY"
        let dateLabelStr = dateFormatter.string(from: date)
        
        defaults.set(passportStr, forKey:"passport")
        defaults.set(dateLabelStr, forKey:"dateLabel")
    }
}
