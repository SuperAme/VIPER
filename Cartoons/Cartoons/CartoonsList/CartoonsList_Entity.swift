//
//  CartoonsList_Entity.swift
//  Cartoons
//
//  Created by Américo MQ on 14/12/22.
//

import Foundation

struct Cartoon: Decodable {
    let title: String
    let year: Int
    let creator: [String]
    let rating: String
    let genre: [String]
    let runtime_in_minutes: Int
    let episodes: Int
    let image: String
    let id: Int
}
