//
//  TraitementViewController.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 05/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import UIKit
import CoreData

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
        //DeleteAllData()
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
    var nom : String = ""
    
    @IBAction func valider(_ sender: Any) {//called when click on the valider button
        print(dateDebutTraitement.date.addingTimeInterval(3600))
        print(heureTraitement.date)
        print(Calendar.current.component(.hour, from: heureTraitement.date))
        print(Calendar.current.component(.minute, from: heureTraitement.date))
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let traitement = Traitement(context: context)
        traitement.dateDebutDeTraitement = dateDebutTraitement.date.addingTimeInterval(3600) as NSDate
        traitement.dateFinDeTraitement = dateFinTraitement.date.addingTimeInterval(3600) as NSDate
        print((Int64(Calendar.current.component(.hour, from: heureTraitement.date))))
        traitement.heureDeTraitement = (Int32(Calendar.current.component(.hour, from: heureTraitement.date)))
        traitement.minuteDeTraitement = (Int32(Calendar.current.component(.minute, from: heureTraitement.date)))
        traitement.nom = nom
        print (nom)
        
        do {
            try context.save()
            
            
            let request : NSFetchRequest<Traitement> = Traitement.fetchRequest()
            //request.predicate = NSPredicate(format: "age = %@", "12")
            request.returnsObjectsAsFaults = false
            do {
                let result = try context.fetch(request)
                for data in result as [NSManagedObject] {
                    print(data.value(forKey: "nom") as! String)
                }
                
            } catch {
                
                print("Failed")
            }
        } catch {
            print("Failed saving")
        }
        
    }
    
    func DeleteAllData(){
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Traitement"))
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        print("Selected Cell Text #\(traitement[indexPath.row])")
        nom = traitement[indexPath.row]
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
