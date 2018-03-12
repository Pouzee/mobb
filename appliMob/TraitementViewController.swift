//
//  TraitementViewController.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 05/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import UIKit

class TraitementViewController: UIViewController,UITableViewDataSource,
UITableViewDelegate{

    func readPropertyList(){
        
        var format = PropertyListSerialization.PropertyListFormat.xml//format of the property list
        var plistData:[String] = []  //our data
        let plistPath:String? = Bundle.main.path(forResource: "TraitementPList", ofType: "plist")! //the path of the data
        let plistXML = FileManager.default.contents(atPath: plistPath!)! //the data in XML format
        do{ //convert the data to a dictionary and handle errors.
            plistData = try PropertyListSerialization.propertyList(from: plistXML,options: .mutableContainersAndLeaves,format: &format)as! [String]
            traitement = plistData 
        }
        catch{ // error condition
            print("Error reading plist: \(error), format: \(format)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readPropertyList()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    var traitement : [String] = []
    
    @IBOutlet weak var traitementTable: UITableView!//La table
    @IBOutlet weak var dateDebutTraitement: UIDatePicker!//datepicker Debut de traitment
    @IBOutlet weak var heureTraitement: UIDatePicker!//datepicker Heure de traitement
    @IBOutlet weak var dateFinTraitement: UIDatePicker!//datepicker Fin du traitement
    
    @IBAction func valider(_ sender: Any) {//called when click on the valider button
        print(dateDebutTraitement.date)
        print(heureTraitement.date)
        print(Calendar.current.component(.hour, from: heureTraitement.date))
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.traitement.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.traitementTable.dequeueReusableCell(withIdentifier: "traitementCell", for: indexPath)as!TraitementTableViewCell
        cell.nomTraitement.text = self.traitement[indexPath.row]
        return cell
    }
    
    
    
}
