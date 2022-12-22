//
//  SuperHeroView.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 21/12/22.
//

import Foundation
import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Im Here")
        tableViewConfigurations()
        presenter?.viewDidLoad()
    }
    
    func tableViewConfigurations() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        }
    }
    
    func update(with error: String) {
        
    }
}

extension SuperHeroView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell number \(indexPath.row)")
    }
}

extension SuperHeroView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        var content = cell.defaultContentConfiguration()
        content.text = superHeroes[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    
}

