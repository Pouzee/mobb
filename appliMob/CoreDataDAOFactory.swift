//
//  CoreDataDAOFactory.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 20/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import Foundation
class CoreDataDAOFactory: AbstractDAOFactory {
    
    typealias TraitementDAO = CDTraitementDAO
    typealias RdvDAO = CDRdvDAO
    typealias ActiviteDAO = CDActiviteDAO
    typealias SyntheseDAO = CDSyntheseDAO
    
    private static var instance: CoreDataDAOFactory?
    
    
    init() {}
    
    // Singleton pattern
    static func getInstance() -> CoreDataDAOFactory {
        guard let instanceFactory = CoreDataDAOFactory.instance else {
            return CoreDataDAOFactory()
        }
        return instanceFactory
    }
    
    //MARK: DAOs
    func getTraitementDAO() -> CDTraitementDAO {
        return CDTraitementDAO()
    }
    
    func getRdvDAO() -> CDRdvDAO{
        return CDRdvDAO()
    }
    func getActiviteDAO() -> CDActiviteDAO{
        return CDActiviteDAO()
        
    }
    func getSyntheseDAO() -> CDSyntheseDAO {
        return CDSyntheseDAO()
    }
}
