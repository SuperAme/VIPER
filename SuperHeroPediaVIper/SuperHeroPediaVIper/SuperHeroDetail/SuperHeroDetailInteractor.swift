//
//  SuperHeroDetailInteractor.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 23/12/22.
//

import Foundation

// Talks to presenter

protocol SuperHeroDetailInteractorProtocol {
    var presenter: SuperHeroDetailPresenterProtocol? { get set }
    var superHero: SuperHeroModel? { get set }
    
    func getSuperHeroData()
}

class SuperHeroDetailInteractor: SuperHeroDetailInteractorProtocol {
    var presenter: SuperHeroDetailPresenterProtocol?
    
    var superHero: SuperHeroModel?
    
    func getSuperHeroData() {
        presenter?.interactorWithData(superHero: superHero)
    }
}
