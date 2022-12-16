//
//  CartoonsList_Router.swift
//  Cartoons
//
//  Created by Américo MQ on 14/12/22.
//

import UIKit

// EntryPoint

protocol CartoonsList_Router_Protocol {
    var entry: CartoonsListViewController? { get }
    static func startExecution() -> CartoonsList_Router_Protocol
    
    func goToDetailView(cartoon: Cartoon)
}

class CartoonsList_Router: CartoonsList_Router_Protocol {
    var entry: CartoonsListViewController?
    
    static func startExecution() -> CartoonsList_Router_Protocol {
        let router = CartoonsList_Router()
        let view = CartoonsListViewController()
        let presenter = CartoonsList_Presenter()
        var interactor = CartoonsList_Interactor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view
        
        return router
    }
    
    func goToDetailView(cartoon: Cartoon) {
        let detailRouter = CartoonDetail_Router.createCartoonDetail(with: cartoon)
        guard let detailView = detailRouter.entry else { return }
        guard let viewController = self.entry else { return }
        
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
    
    
}
