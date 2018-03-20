//
//  CDTraitementDAO.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 20/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import Foundation
import CoreData

class CDTraitementDAO: CDDAO, PatientDAO {
    
    func create() throws -> Traitement {
        return Traitement(dateDebutDeTraitement: Date(), dateFinDeTraitement: Date(), nomTraitement: String())
    }
    
    func delete(obj: Traitement) {
        // TODO
    }
    
    func getAll() throws -> [Traitement]? {
        let request: NSFetchRequest<TraitementCoreData> = NSFetchRequest(entityName: "TraitementCoreData")
        do {
            let traitements:[Traitement] = try self.context.fetch(request as! NSFetchRequest<NSFetchRequestResult>) as! [Traitement]
            return traitements
        } catch let error {
            throw error
        }
    }
    
    
    
}
