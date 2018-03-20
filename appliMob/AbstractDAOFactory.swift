//
//  AbstractDAOFactory.swift
//  appliMob
//
//  Created by Clement LOUBIERE on 20/03/2018.
//  Copyright © 2018 Clement LOUBIERE. All rights reserved.
//

import Foundation


protocol AbstractDAOFactory {
    associatedtype TraitementDAO
    

    
    func getTraitementDAO() ->TraitementDAO
    
}
