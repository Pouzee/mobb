//
//  CDRdvDAO.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 22/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import Foundation
import CoreData

class CDRdvDAO: CDDAO, RdvDAO {
    
    func create() throws -> Rdv{
        return Rdv(context: self.context)
    }
    
    func delete(obj: Rdv) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Rdv?] {
        var Rdvs: [Rdv] = []
        let request: NSFetchRequest<Rdv> = NSFetchRequest(entityName: "Rdv")
        do {
            Rdvs = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return Rdvs
        
        
        
    }
    
    
    
}
