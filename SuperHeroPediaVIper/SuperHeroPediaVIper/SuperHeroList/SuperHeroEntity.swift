//
//  SuperHeroEntity.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 21/12/22.
//

import Foundation

struct SuperHeroModel: Codable {
    let name: String
    let images: HeroesImages
}

struct HeroesImages: Codable {
    let sm: String?
    let lg: String?
}
