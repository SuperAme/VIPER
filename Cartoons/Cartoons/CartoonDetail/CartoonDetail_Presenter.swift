//
//  CartoonDetail_Presenter.swift
//  Cartoons
//
//  Created by Américo MQ on 14/12/22.
//

import Foundation

//Talks to router
//Talks to view
//Talks to interactor

protocol CartoonDetail_Presenter_Protocol {
    var router: CartoonDetail_Router_Protocol? { get set }
    var interactor: CartoonDetail_Interactor_Protocol? { get set }
    var view: CartoonDetail_View_Protocol? { get set }
    
    func interactorUpdateData(cartoon: Cartoon?)
    func viewDidLoad()
}

class CartoonDetail_Presenter: CartoonDetail_Presenter_Protocol {
    var router: CartoonDetail_Router_Protocol?
    
    var interactor: CartoonDetail_Interactor_Protocol?
    
    var view: CartoonDetail_View_Protocol?
    
    func interactorUpdateData(cartoon: Cartoon?) {
        if let cartoon = cartoon {
            view?.update(with: cartoon)
        } else {
            view?.update(with: "No data")
        }
        
    }
    
    func viewDidLoad() {
        interactor?.getCartoonData()
    }
    
    
}
