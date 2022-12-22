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
}

class SuperHeroView: UIViewController, SuperHeroViewProtocol {
    var presenter: SuperHeroPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Im Here")
    }
    
}
