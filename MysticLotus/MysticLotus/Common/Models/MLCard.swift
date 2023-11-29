//
//  MLCard.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 15/11/23.
//

import Foundation
import UIKit
import ScryfallKit

struct MLCard: Decodable {
    let id: String
    let cardImage: String?
    let name: String
    let manaCost: String?
    let typeLine: String?
    let flavorText: String?
    let artist: String?
    let setName: String
    
    init(id: String, cardImageUris: Card.ImageUris?, name: String, manaCost: String?, typeLine: String?, flavorText: String?, artist: String?, setName: String) {
        self.id = id
        self.cardImage = cardImageUris?.normal
        self.name = name
        self.manaCost = manaCost
        self.typeLine = typeLine
        self.flavorText = flavorText
        self.artist = artist
        self.setName = setName
    }

}


