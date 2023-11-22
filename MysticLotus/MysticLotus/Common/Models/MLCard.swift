//
//  MLCard.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 15/11/23.
//

import Foundation

struct MLCard: Decodable {
    //let image: String
    let name: String
    let manaCost: String?
    let typeLine: String?
    let flavorText: String?
    let artist: String?
    let setName: String
    //let rulings: Rulings
}
