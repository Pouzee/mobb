//
//  ProfessionnelViewController.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 05/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import UIKit

class ProfessionnelViewController: UIViewController,UITableViewDataSource,
UITableViewDelegate {
    
    func readPropertyList(){
        
        var format = PropertyListSerialization.PropertyListFormat.xml//format of the property list
        var plistData:[String] = []  //our data
        let plistPath:String? = Bundle.main.path(forResource: "ProfessionnelPList", ofType: "plist")! //the path of the data
        let plistXML = FileManager.default.contents(atPath: plistPath!)! //the data in XML format
        do{ //convert the data to a dictionary and handle errors.
            plistData = try PropertyListSerialization.propertyList(from: plistXML,options: .mutableContainersAndLeaves,format: &format)as! [String]
            professionnel = plistData
        }
        catch{ // error condition
            print("Error reading plist: \(error), format: \(format)")
        }
    }

    var professionnel : [String] = []
    
    @IBOutlet weak var professionnelTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        readPropertyList()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.professionnel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.professionnelTable.dequeueReusableCell(withIdentifier: "ProfessionnelCell", for: indexPath)as!ProfessionnelTableViewCell
        cell.ProfessionnalName.text = self.professionnel[indexPath.row]
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
