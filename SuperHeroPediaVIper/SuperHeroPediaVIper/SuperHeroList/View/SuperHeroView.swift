//
//  SuperHeroView.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 21/12/22.
//

import Foundation
import UIKit
import Kingfisher

//Talks to presenter

protocol SuperHeroViewProtocol {
    var presenter: SuperHeroPresenterProtocol? { get set }
    
    func update(with superHeroes: [SuperHeroModel])
    func update(with error: String)
}

class SuperHeroView: UIViewController, SuperHeroViewProtocol {
    
    var presenter: SuperHeroPresenterProtocol?
    
    var superHeroes: [SuperHeroModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfigurations()
        presenter?.viewDidLoad()
    }
    
    func tableViewConfigurations() {
        let cell = UINib(nibName: "SuperHeroTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "customCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SuperHeroView {
    func update(with superHeroes: [SuperHeroModel]) {
        DispatchQueue.main.async { [weak self] in
            self?.superHeroes = superHeroes
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
            self?.errorLabel.isHidden = true
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.superHeroes = []
            self?.tableView.isHidden = true
            self?.errorLabel.isHidden = false
        }
    }
}

extension SuperHeroView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell number \(superHeroes[indexPath.row])")
    }
}

extension SuperHeroView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? SuperHeroTableViewCell {
            cell.nameLabel.text = superHeroes[indexPath.row].name
            if let image = superHeroes[indexPath.row].images.sm ,let url = URL(string: image) {
                cell.heroImage.kf.setImage(with: url)
            } else {
                cell.heroImage.image = UIImage(named: "no-image")
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}

