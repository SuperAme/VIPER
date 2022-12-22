//
//  SuperHeroInteractor.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 21/12/22.
//

import UIKit

//Talks to the presenter

protocol SuperHeroInteractorProtocol {
    var presenter: SuperHeroPresenterProtocol? { get set }
    
    func getSuperHeroesList()
}

class SuperHeroInteractor: SuperHeroInteractorProtocol {
    var presenter: SuperHeroPresenterProtocol?
    
    func getSuperHeroesList() {
        guard let url = URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorWithData(result: .failure(NetworkError.serverError))
                return
            }
            
            do {
                let superHeroes = try JSONDecoder().decode([SuperHeroModel].self, from: data)
                self?.presenter?.interactorWithData(result: .success(superHeroes))
            } catch {
                self?.presenter?.interactorWithData(result: .failure(NetworkError.decodingError))
            }
        }
        task.resume()
    }
}
