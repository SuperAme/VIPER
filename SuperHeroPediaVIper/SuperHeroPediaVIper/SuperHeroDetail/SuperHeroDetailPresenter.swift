//
//  SuperHeroDetailPresenter.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 23/12/22.
//

import Foundation

// Talks to view
// Talks to Interactor
// Talks to Router

protocol SuperHeroDetailPresenterProtocol {
    var view: SuperHeroDetailViewProtocol? { get set }
    var interactor: SuperHeroDetailInteractorProtocol? { get set }
    var router: SuperHeroDetailRouterProtocol? { get set }
    
    func interactorWithData(superHero: SuperHeroModel?)
    func viewDidLoad()
}

class SuperHeroDetailPresenter: SuperHeroDetailPresenterProtocol {
    var view: SuperHeroDetailViewProtocol?
    
    var interactor: SuperHeroDetailInteractorProtocol?
    
    var router: SuperHeroDetailRouterProtocol?
    
    func interactorWithData(superHero: SuperHeroModel?) {
        if let superHero = superHero {
            view?.update(with: superHero)
        } else {
            view?.update(with: "No data")
        }
    }
    
    func viewDidLoad() {
        interactor?.getSuperHeroData()
    }
}
