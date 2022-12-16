//
//  CartoonDetail_Interactor.swift
//  Cartoons
//
//  Created by Américo MQ on 14/12/22.
//

import Foundation

//Talks to presenter

protocol CartoonDetail_Interactor_Protocol {
    var presenter: CartoonDetail_Presenter_Protocol? { get set }
    var cartoon: Cartoon? { get set }
    
    func getCartoonData()
}

class CartoonDetail_Interactor: CartoonDetail_Interactor_Protocol {
    var presenter: CartoonDetail_Presenter_Protocol?
    
    var cartoon: Cartoon?
    
    func getCartoonData() {
        presenter?.interactorUpdateData(cartoon: cartoon)
    }
    
    
}


