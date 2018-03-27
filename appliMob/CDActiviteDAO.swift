//
//  CDActiviteDAO.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 27/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import Foundation
import CoreData

class CDActiviteDAO: CDDAO, ActiviteDAO {
    
    func create() throws -> Activite {
        return Activite(context: self.context)
    }
    
    func delete(obj: Activite) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Activite?] {
        var activites: [Activite] = []
        let request: NSFetchRequest<Activite> = NSFetchRequest(entityName: "Activite")
        do {
            activites = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return activites
        
        
        
    }
    
    
    
}
