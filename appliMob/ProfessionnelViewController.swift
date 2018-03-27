//
//  ProfessionnelViewController.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 05/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import UIKit
import CoreData

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
    var nom : String = ""
    
    @IBOutlet weak var professionnelTable: UITableView!
    @IBOutlet weak var heureAvance: UITextField!
    @IBOutlet weak var dateRdv: UIDatePicker!
    
    
    
    @IBAction func cancelPopUp(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    @IBAction func Valider(_ sender: Any) {
        
        //print(dateRdv.date.addingTimeInterval(3600))

        
        /*let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let rdv = Rdv(context: context)
        rdv.date = dateRdv.date/*.addingTimeInterval(3600)*/ as NSDate
        rdv.rappel = Int32(Int(heureAvance.text ?? "0") ?? 0)
        rdv.professionnel = nom
        print (nom)*/
        
        do {
            let rdv : Rdv = try CoreDataDAOFactory.getInstance().getRdvDAO().create()
            rdv.date = dateRdv.date/*.addingTimeInterval(3600)*/ as NSDate
            rdv.rappel = Int32(Int(heureAvance.text ?? "0") ?? 0)
            rdv.professionnel = nom
            
            
            try CoreDataDAOFactory.getInstance().getTraitementDAO().save()
            
        } catch {
            print("Failed saving")
        }
        let diff = Int(heureAvance.text!)
        let dateAvance = dateRdv.date.addingTimeInterval(TimeInterval(-3600*(diff ?? 0)))
        NotificationHandler.getInstance().createRdvNotification(date : Calendar.current.dateComponents(in: TimeZone.current, from: dateAvance), titre: nom)
        EventHandler.getInstance().createEvent(title: nom, date: dateAvance as NSDate)
        self.view.removeFromSuperview()
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        print("Selected Cell Text #\(professionnel[indexPath.row])")
        nom = professionnel[indexPath.row]
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
