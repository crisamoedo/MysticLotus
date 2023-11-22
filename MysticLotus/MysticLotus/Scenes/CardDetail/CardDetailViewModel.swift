//
//  CardDetailViewModel.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 15/11/23.
//

import Foundation
import ScryfallKit
import Combine

protocol CardDetailViewModelProtocol {
    var cardDetail: MLCard {get}
    var view: CardDetailViewControllerProtocol? {get}
    var fieldsSections: [FieldsSection] {get}
}

class CardDetailViewModel: CardDetailViewModelProtocol {
  
    var cardDetail: MLCard
    var view: CardDetailViewControllerProtocol?
    var fieldsSections: [FieldsSection] {
        return [
            FieldsSection(title: "Card", fields: [
                Field(title: "Card name: ", value: cardDetail.name),
                        Field(title: "Mana Cost: ", value: cardDetail.manaCost),
                        Field(title: "Type line: ", value: cardDetail.typeLine),
                        Field(title: "Flavor text: ", value: cardDetail.flavorText),
                        Field(title: "Artist: ", value: cardDetail.artist),
                        Field(title: "Set name: ", value: cardDetail.setName)
            ])
        ]
    }
    
    private let cardDetailCoordinator: CardDetailCoordinatorProtocol
    
    init(cardDetailCoordinator: CardDetailCoordinator,
         view: CardDetailViewControllerProtocol?,
         card: MLCard) {
        self.cardDetailCoordinator = cardDetailCoordinator
        self.view = view
        self.cardDetail = card
    }
}
