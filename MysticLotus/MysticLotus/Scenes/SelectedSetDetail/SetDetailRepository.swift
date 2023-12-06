//
//  SetDetailRepository.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 28/11/23.
//

import ScryfallKit
import Combine

protocol SetDetailRepositoryProtocol {
    func getCardsSet() -> AnyPublisher<[MLCard], Never>
}

class SetDetailRepository: SetDetailRepositoryProtocol {
    func getCardsSet() -> AnyPublisher<[MLCard], Never> {
        return Future { promise in
            ScryfallClient().searchCards(filters: [.set("")]) { result in
                switch result {
                case .success(let cards):
                    let mappedSets = cards.data.map { card in
                        return MLCard(id: "\(card.id)", cardImageUris: card.imageUris,
                                      name: card.name,
                                      manaCost: card.manaCost?.filtrarNumeros(),
                                      typeLine: card.typeLine,
                                      flavorText: card.flavorText,
                                      artist: card.artist,
                                      setName: card.setName)
                    }
                    promise(.success(mappedSets))
                case .failure:
                    promise(.success([]))
                }
            }
        }.eraseToAnyPublisher()
    }
}
