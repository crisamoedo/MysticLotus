//
//  SearchDataCardRepository.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 8/11/23.
//

import ScryfallKit
import Combine

protocol DataCardRepositoryProtocol {
    func searchCards(searchText: String) -> AnyPublisher<[MLCard], Never>
}

class DataCardRepository: DataCardRepositoryProtocol{
    func searchCards(searchText: String) -> AnyPublisher<[MLCard], Never> {
        return Future { promise in
            ScryfallClient().searchCards(query: searchText) { result in
                switch result {
                case .success(let cards):
                    let mappedCards = cards.data.map { card in
                        return MLCard(id: "\(card.id)", cardImageUris: card.imageUris,
                                      name: card.name,
                                      manaCost: card.manaCost?.filtrarNumeros(),
                                      typeLine: card.typeLine,
                                      flavorText: card.flavorText,
                                      artist: card.artist,
                                      setName: card.setName)
                        
                    }
                   
                    promise(.success(mappedCards))
                case .failure:
                    promise(.success([]))
                }
            }
        }.eraseToAnyPublisher()
    }
}
