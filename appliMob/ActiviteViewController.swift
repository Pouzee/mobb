//
//  ActiviteViewController.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 26/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import UIKit

class ActiviteViewController: UIViewController {

    @IBOutlet weak var nomActivite: UITextField!
    @IBOutlet weak var dateActivite: UIDatePicker!
    @IBOutlet weak var rappelActivite: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelPopUp(_ sender: Any) {
        
        self.view.removeFromSuperview()
    }

    @IBAction func validatePopUp(_ sender: Any) {
        
        do {
            let rdv : Activite = try CoreDataDAOFactory.getInstance().getActiviteDAO().create()
            rdv.heure = dateActivite.date/*.addingTimeInterval(3600)*/ as NSDate
            rdv.rappel = Int32(Int(rappelActivite.text ?? "0") ?? 0)
            rdv.nom = nomActivite.text
            
            if ((rdv.heure! as Date) < Date()){
                rdv.heure = Date() as NSDate
            }
            
            try CoreDataDAOFactory.getInstance().getTraitementDAO().save()
            
        } catch {
            print("Failed saving")
        }
        let diff = Int(rappelActivite.text!)
        let dateAvance = dateActivite.date.addingTimeInterval(TimeInterval(-3600*(diff ?? 0)))
        NotificationHandler.getInstance().createActiviteNotification(date : Calendar.current.dateComponents(in: TimeZone.current, from: dateAvance), titre: nomActivite.text!)
        EventHandler.getInstance().createEvent(title: nomActivite.text!, date: dateAvance as NSDate)
        self.view.removeFromSuperview()
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
