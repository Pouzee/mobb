//
//  TraitementDAO.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 20/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import Foundation



protocol PatientDAO: DAO {
    associatedtype Object = Traitement
    
    func create() throws -> Traitement
    
    func delete(obj: Traitement)
    
    func getAll() throws -> [Traitement]?
    
}
