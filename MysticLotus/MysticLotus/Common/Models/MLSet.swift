//
//  MLSet.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 21/11/23.
//

import Foundation
import UIKit
import ScryfallKit

struct MLSet: Decodable {
    let id: String
    let name: String
    let cardCount: Int
    
    init(id: String, name: String, cardCount: Int) {
        self.id = id
        self.name = name
        self.cardCount = cardCount
    }
}
