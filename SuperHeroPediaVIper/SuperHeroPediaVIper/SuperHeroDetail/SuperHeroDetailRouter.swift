//
//  SuperHeroDetailRouter.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 23/12/22.
//

import UIKit

protocol SuperHeroDetailRouterProtocol {
    var entry: SuperHeroDetailView? { get }
    static func createSuperHeroDetail(with hero: SuperHeroModel) -> SuperHeroDetailRouterProtocol
}

class SuperHeroDetailRouter: SuperHeroDetailRouterProtocol {
    var entry: SuperHeroDetailView?
    
    static func createSuperHeroDetail(with hero: SuperHeroModel) -> SuperHeroDetailRouterProtocol {
        let heroDetailStoryboard = UIStoryboard(name: "SuperHeroDetailView", bundle: nil)
        let view = heroDetailStoryboard.instantiateViewController(withIdentifier: "SuperHeroDetailViewId") as! SuperHeroDetailView
        
        
        let router = SuperHeroDetailRouter()
        let interactor = SuperHeroDetailInteractor()
        let presenter = SuperHeroDetailPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.superHero = hero
        
        router.entry = view
        
        return router
    }
    
}
