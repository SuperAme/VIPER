//
//  CartoonDetail_Router.swift
//  Cartoons
//
//  Created by Américo MQ on 14/12/22.
//

import Foundation

// EntryPoint

protocol CartoonDetail_Router_Protocol {
    var entry: CartoonDetail_ViewController? { get }
    static func createCartoonDetail(with cartoon: Cartoon) -> CartoonDetail_Router_Protocol
}

class CartoonDetail_Router: CartoonDetail_Router_Protocol {
    var entry: CartoonDetail_ViewController?
    
    static func createCartoonDetail(with cartoon: Cartoon) -> CartoonDetail_Router_Protocol {
        let router = CartoonDetail_Router()
        let view = CartoonDetail_ViewController()
        let presenter = CartoonDetail_Presenter()
        let interactor = CartoonDetail_Interactor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.cartoon = cartoon
        
        router.entry = view
        
        return router
    }
    
}
