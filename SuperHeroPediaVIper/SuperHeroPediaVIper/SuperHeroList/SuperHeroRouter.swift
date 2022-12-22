//
//  SuperHeroRouter.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 21/12/22.
//

import UIKit

protocol SuperHeroRouterProtocol {
    var entry: SuperHeroView? { get }
    static func startExecution() -> SuperHeroRouterProtocol
    
    func goToDetailView(superHero: SuperHeroModel)
}

class SuperHeroRouter: SuperHeroRouterProtocol {
    var entry: SuperHeroView?
    
    static func startExecution() -> SuperHeroRouterProtocol {
        let sb = UIStoryboard(name: "MainSuperHeroView", bundle: nil)
        let view = sb.instantiateViewController(withIdentifier: "SuperHeroViewId") as! SuperHeroView
//        let view = SuperHeroView()
        
        let interactor = SuperHeroInteractor()
        let presenter = SuperHeroPresenter()
        let router = SuperHeroRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view
        
        return router
    }
    
    func goToDetailView(superHero: SuperHeroModel) {
        
    }
    
    
}
