//
//  SyntheseViewController.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 27/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import UIKit
import CoreData

class SyntheseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var syntheseTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSynthese()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchSynthese(){
        do {
            //let result = try context.fetch(request)
            let result : [Synthese] = try CoreDataDAOFactory.getInstance().getSyntheseDAO().getAll() as! [Synthese]
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
                affich += data.value(forKey : "texte") as? String ?? " "
                
                syntheses.append(affich)
            }
            
        } catch {
            
            print("Failed")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    var syntheses : [String] = ["cc"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.syntheses.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.syntheseTable.dequeueReusableCell(withIdentifier: "syntheseCell", for: indexPath)as! SyntheseTableViewCell
        cell.information.text = self.syntheses[indexPath.row]
        return cell
    }

}
