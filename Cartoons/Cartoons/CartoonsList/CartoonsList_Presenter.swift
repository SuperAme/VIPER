//
//  CartoonsList_Presenter.swift
//  Cartoons
//
//  Created by Américo MQ on 14/12/22.
//

import Foundation

// Talk to router
// Talk to View
// Tals to interactor

protocol CartoonsList_Presenter_Protocol {
    var router: CartoonsList_Router_Protocol? { get set }
    var view: CartoonsList_View_Protocol? { get set }
    var interactor: CartoonsList_Interactor_Protocol? { get set }
    
    func viewDidLoad()
    func interactorWithData(result: Result<[Cartoon], Error>)
    func tapOnDetail(_ cartoon: Cartoon)
}

class CartoonsList_Presenter: CartoonsList_Presenter_Protocol {
    var router: CartoonsList_Router_Protocol?
    
    var view: CartoonsList_View_Protocol?
    
    var interactor: CartoonsList_Interactor_Protocol?
    
    func viewDidLoad() {
        interactor?.getCartoonsListData()
    }
    
    func interactorWithData(result: Result<[Cartoon], Error>) {
        switch(result) {
        case .success(let cartoons):
//            print("Success")
            view?.update(with: cartoons)
        case .failure(let error):
//            print("Error: \(error)")
            view?.update(with: "Try again later...")
        }
    }
    
    func tapOnDetail(_ cartoon: Cartoon) {
        router?.goToDetailView(cartoon: cartoon)
    }
    
    
}
