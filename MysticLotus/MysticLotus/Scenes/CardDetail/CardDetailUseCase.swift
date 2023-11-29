//
//  CardDetailUseCase.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 23/11/23.
//

import Foundation
import ScryfallKit
import Combine

protocol CardDetailUseCaseProtocol {
    var cardDetailRepository: CardRulingsRepositoryProtocol? {get}
    func getRulings(id: Card.Ruling.Identifier) -> AnyPublisher<[MLRulingsCard], Never>
}
class CardDetailUseCase : CardDetailUseCaseProtocol{
    var cardDetailRepository: CardRulingsRepositoryProtocol?
    
    init(cardDetailRepository: CardRulingsRepositoryProtocol?) {
        self.cardDetailRepository = cardDetailRepository
    }
    
    func getRulings(id: Card.Ruling.Identifier) -> AnyPublisher<[MLRulingsCard], Never> {
        guard let cardDetailRepository =
                cardDetailRepository else {
            return Just([]).eraseToAnyPublisher()
        }
        return cardDetailRepository
            .getRulings(id: id)
            .eraseToAnyPublisher()
    }
}

