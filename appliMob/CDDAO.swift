//
//  CDDAO.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 22/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import Foundation
import CoreData

class CDDAO {
    var context: NSManagedObjectContext
    
    init() {
        let CDC  = CoreDataConnection()
        self.context = CDC.getContext()
    }
    
    // =============================
    
    func save() throws {
        do {
            try context.save()
        } catch let error {
            throw error
        }
        
    }
}
