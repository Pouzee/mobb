//
//  CDSyntheseDAO.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 27/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import Foundation
import CoreData

class CDSyntheseDAO: CDDAO, SyntheseDAO {
    
    func create() throws -> Synthese {
        return Synthese(context: self.context)
    }
    
    func delete(obj: Synthese) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Synthese?] {
        var syntheses: [Synthese] = []
        let request: NSFetchRequest<Synthese> = NSFetchRequest(entityName: "Synthese")
        do {
            syntheses = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return syntheses
        
        
        
    }
    
    
    
}
