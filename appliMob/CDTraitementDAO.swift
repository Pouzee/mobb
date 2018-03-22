//
//  CDTraitementDAO.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 20/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import Foundation
import CoreData

class CDTraitementDAO: CDDAO, TraitementDAO {
    
    func create() throws -> TraitementCoreData {
        return TraitementCoreData(context: self.context)
    }
    
    func delete(obj: TraitementCoreData) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [TraitementCoreData?] {
        var traitements: [TraitementCoreData] = []
        let request: NSFetchRequest<TraitementCoreData> = NSFetchRequest(entityName: "TraitementCoreData")
        do {
            traitements = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return traitements
        
      
        
    }
    
    
    
}
