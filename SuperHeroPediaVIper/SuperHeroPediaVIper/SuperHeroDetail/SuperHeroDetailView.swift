//
//  SuperHeroDetailView.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 23/12/22.
//

import Foundation
import UIKit

// Talk to presenter

protocol SuperHeroDetailViewProtocol {
    var presenter: SuperHeroDetailPresenterProtocol? { get set }
    
    func update(with superHero: SuperHeroModel)
    func update(with error: String)
}

class SuperHeroDetailView: UIViewController, SuperHeroDetailViewProtocol {
    var presenter: SuperHeroDetailPresenterProtocol?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension SuperHeroDetailView {
    func update(with superHero: SuperHeroModel) {
        nameLabel.text = superHero.name
        if let image = superHero.images.lg, let url = URL(string: image) {
            heroImage.load(url: url)
            heroImage.isHidden = false
        }
    }
    
    func update(with error: String) {
        nameLabel.text = error
        nameLabel.textColor = .red
    }

}
