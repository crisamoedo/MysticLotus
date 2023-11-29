//
//  CardDetailRepository.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 23/11/23.
//

import ScryfallKit
import Combine

protocol CardRulingsRepositoryProtocol {
    func getRulings(id: Card.Ruling.Identifier) -> AnyPublisher<[MLRulingsCard], Never>
}

class CardRulingsRepository: CardRulingsRepositoryProtocol {
    func getRulings(id: Card.Ruling.Identifier) -> AnyPublisher<[MLRulingsCard], Never> {
        return Future { promise in
            ScryfallClient().getRulings(id) { result in
                switch result {
                case .success(let cards):
                    let mappedRulings = cards.data.map { card in
                        return MLRulingsCard(releasedAt: card.publishedAt, comment: card.comment)
                    }
                    promise(.success(mappedRulings))
                case .failure:
                    promise(.success([]))
                }
            }
        }.eraseToAnyPublisher()
    }
}
