//
//  SetDataRepository.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 17/11/23.
//

import ScryfallKit
import Combine

protocol SetDataRepositoryProtocol {
    func getSets() -> AnyPublisher<[MLSet], Never>
}

class SetDataRepository: SetDataRepositoryProtocol {
    func getSets() -> AnyPublisher<[MLSet], Never> {
        return Future { promise in
            ScryfallClient().getSets() { result in
                switch result {
                case .success(let sets):
                    let mappedSets = sets.data.map { set in
                        return MLSet(id: "\(set.id)", name: set.name, cardCount: set.cardCount)
                    }
                    promise(.success(mappedSets))
                case .failure:
                    promise(.success([]))
                }
            }
        }.eraseToAnyPublisher()
    }
}

