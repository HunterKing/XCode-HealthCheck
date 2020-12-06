//
//  PassportView.swift
//  
//
//  Created by Hunter King on 12/5/20.
//

import UIKit

class PassportView: UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var passportTimeStamp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = defaults.string(forKey: "dateLabel")
        passportTimeStamp.text = defaults.string(forKey: "passport")
        // Do any additional setup after loading the view.
    }
}
