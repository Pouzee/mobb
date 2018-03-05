//
//  ProfessionnelTableViewCell.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 05/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import UIKit

class ProfessionnelTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ProfessionnalName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
