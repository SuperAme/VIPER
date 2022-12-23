//
//  SuperHeroPresenter.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 21/12/22.
//

import UIKit

// Talks to view
// Talks to interactor
// Talks to router

protocol SuperHeroPresenterProtocol {
    var view: SuperHeroViewProtocol? { get set }
    var interactor: SuperHeroInteractorProtocol? { get set }
    var router: SuperHeroRouterProtocol? { get set }
    
    func viewDidLoad()
    func interactorWithData(result: Result<[SuperHeroModel], Error>)
    func tapOnDetail(_ superhero: SuperHeroModel)
}

class SuperHeroPresenter: SuperHeroPresenterProtocol {
    var view: SuperHeroViewProtocol?
    
    var interactor: SuperHeroInteractorProtocol?
    
    var router: SuperHeroRouterProtocol?
    
    func viewDidLoad() {
        interactor?.getSuperHeroesList()
    }
    
    func interactorWithData(result: Result<[SuperHeroModel], Error>) {
        switch result {
        case .success(let superHeroes):
            view?.update(with: superHeroes)
        case .failure(let error):
            view?.update(with: "Try again later ...")
        }
    }
    
    func tapOnDetail(_ superhero: SuperHeroModel) {
        router?.goToDetailView(superHero: superhero)
    }
    
    
}
