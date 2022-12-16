//
//  CartoonsList_Interactor.swift
//  Cartoons
//
//  Created by Américo MQ on 14/12/22.
//

import Foundation

// Talk to presenter

protocol CartoonsList_Interactor_Protocol {
    var presenter: CartoonsList_Presenter_Protocol? { get set }
    
    func getCartoonsListData()
}

class CartoonsList_Interactor: CartoonsList_Interactor_Protocol {
    var presenter: CartoonsList_Presenter_Protocol?
    
    func getCartoonsListData() {
        guard let url = URL(string: "https://api.sampleapis.com/cartoons/cartoons2D") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorWithData(result: .failure(NetworkError.serverError))
                return
            }
            
            do {
                let cartoons = try JSONDecoder().decode([Cartoon].self, from: data)
                self?.presenter?.interactorWithData(result: .success(cartoons))
            } catch {
                self?.presenter?.interactorWithData(result: .failure(NetworkError.decodingError))
            }
                
        }
        task.resume()
    }
    
    
}
