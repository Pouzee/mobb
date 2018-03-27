//
//  SyntheseViewController.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 27/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import UIKit

class SyntheseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var syntheseTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
