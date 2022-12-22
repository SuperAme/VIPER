//
//  SuperHeroInteractor.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 21/12/22.
//

import UIKit

//Talks to the presenter

protocol SuperHeroInteractorProtocol {
    var presenter: SuperHeroPresenterProtocol? { get set }
}

class SuperHeroInteractor: SuperHeroInteractorProtocol {
    var presenter: SuperHeroPresenterProtocol?
    
    
}
