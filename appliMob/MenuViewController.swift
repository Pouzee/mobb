//
//  MenuViewController.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 14/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import UIKit
import CoreData

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var rdvTable: UITableView!
    @IBOutlet weak var planningTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPlanningDataTraitement()
        fetchPlanningDataRdv()
        fetchDataRdv()
        planning = planning.sorted()
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
    
    func fetchPlanningDataTraitement(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<Traitement> = Traitement.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(Traitement.dateDebutDeTraitement), ascending: true)
        request.sortDescriptors = [sort]
        do {
            let result = try context.fetch(request)
            for data in result as [NSManagedObject] {
                print(data.value(forKey: "nom") as! String)
               
                
                var affich = String(describing: Int(data.value(forKey : "heureDeTraitement")as? Int32 ?? -1))
                
                
                affich += "h"
                let minute = String(describing: Int((data.value(forKey : "minuteDeTraitement")as? Int32 ?? -1) ))
                if (minute.characters.count < 2){
                    affich += "0"
                }
                affich += minute
                affich += " - "
                affich += data.value(forKey : "nom") as? String ?? " "
                
                planning.append(affich)
            }
            
        } catch {
            
            print("Failed")
        }
        
    }
    
    
    func fetchPlanningDataRdv(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<Rdv> = Rdv.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(Rdv.date), ascending: true)
        request.sortDescriptors = [sort]
        do {
            let result = try context.fetch(request)
            for data in result as [NSManagedObject] {
                
                let date = (data.value(forKey : "date")) as? Date
                
                var affich = String(Calendar.current.component(.hour, from:(date ?? Date())))
                affich += "h"
                let minute = String(Calendar.current.component(.minute, from:(date ?? Date())))
                if (minute.characters.count < 2){
                    affich += "0"
                }
                affich += minute
                
                
                affich += " - "
                affich += data.value(forKey : "professionnel") as? String ?? " "
                
                planning.append(affich)
            }
            
        } catch {
            
            print("Failed")
        }
        
    }
    
    func fetchDataRdv(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<Rdv> = Rdv.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(Rdv.date), ascending: true)
        request.sortDescriptors = [sort]
        do {
            let result = try context.fetch(request)
            for data in result as [NSManagedObject] {
                
                let date = (data.value(forKey : "date")) as? Date
                let day = String(Calendar.current.component(.day, from:(date ?? Date())))
                var affich = ""
                if (day.characters.count < 2){
                    affich += "0"
                }
                affich += day + "/"
                let month = String(Calendar.current.component(.month, from:(date ?? Date())))
                if (month.characters.count < 2){
                    affich += "0"
                }
                affich += month + " à "
                
                affich += String(Calendar.current.component(.hour, from:(date ?? Date())))
                affich += "h"
                let minute = String(Calendar.current.component(.minute, from:(date ?? Date())))
                if (minute.characters.count < 2){
                    affich += "0"
                }
                affich += minute
                
                
                affich += " - "
                affich += data.value(forKey : "professionnel") as? String ?? " "
                
                rdv.append(affich)
            }
            
        } catch {
            
            print("Failed")
        }
        
    }
    
    
    var planning : [String] = []
    var rdv : [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if(tableView == planningTable){
            return self.planning.count
        }
        else{
            return self.rdv.count
    
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if(tableView == planningTable){
            let cell = self.planningTable.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)as!MenuTableViewCell
            cell.rdvLabel.text = self.planning[indexPath.row]
            return cell
        }
        else{
            let cell = self.rdvTable.dequeueReusableCell(withIdentifier: "rdvCell", for: indexPath)as!RdvTableViewCell
            cell.rdvLabel.text = self.rdv[indexPath.row]
            return cell
        }
        
    }
}
