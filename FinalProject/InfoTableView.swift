//
//  InfoTableView.swift
//  
//
//  Created by Hunter King on 12/5/20.
//

import UIKit

class InfoTableView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var infoTable: UITableView!
    
    let infoArray = [["CDC", "What to Do If You Are Sick", "Frequently Asked Questions", " How To Protect Yourself", "COVID Data Tracker"], ["Appalachian State", "General Info (Updated Daily)", "Latest Updates", "About COVID-19"], ["App Health Care", "Data Dashboard", "COVID-19 Testing", "Testing FAQ", "Dead Link"]]
    let cdcLinkArray = ["https://www.cdc.gov/coronavirus/2019-ncov/if-you-are-sick/steps-when-sick.html", "https://www.cdc.gov/coronavirus/2019-ncov/faq.html", "https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/prevention.html", "https://covid.cdc.gov/covid-data-tracker/#cases_casesper100klast7days"]
    let appLinkArray = ["https://www.appstate.edu/go/coronavirus/", "https://www.appstate.edu/go/coronavirus/updates/", "https://www.appstate.edu/go/coronavirus/about-covid-19/"]
    let appHCLinkArray = ["https://www.apphealthcare.com/covid-19-information/covid-19-data-dashboard/", "https://www.apphealthcare.com/covid-19-information/covid-19-testing/", "https://www.apphealthcare.com/faqs-covid-19-testing/"]
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTable.dataSource = self
        infoTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = infoArray[indexPath.section][indexPath.row + 1]
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return infoArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return infoArray[section][0]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //let selectedItem = infoArray[indexPath.section][indexPath.row + 1]
        //Test to see what our section is.
        let link = getLinkFromArr(section: indexPath.section, row: indexPath.row)
        //Try to grab a link corresponding to which item we clicked on.
        //Attempt to convert a string to a URL, then open it.
        var url: URL!
        if(link != ""){
            url = URL(string: link)
        }
        if(url != nil){
            UIApplication.shared.open(url)
        }
        //If we can't open a URL, throw a graceful error.
        else{
            let alert = UIAlertController(title: "Error", message: "Couldn't open link!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in})
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func getLinkFromArr(section: Int, row: Int) -> String{
        var link = ""
        switch(section){
        case 0:
            if(row < cdcLinkArray.count){
                link = cdcLinkArray[row]
            }
            break
        case 1:
            if(row < appLinkArray.count){
                link = appLinkArray[row]
            }
            break
        case 2:
            if(row < appHCLinkArray.count){
                link = appHCLinkArray[row]
            }
            break
        default:
            link = ""
            break
        }
        return link
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

         //For Header Background Color
         view.tintColor = .black
        // For Header Text Color
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .systemYellow
    }
}
