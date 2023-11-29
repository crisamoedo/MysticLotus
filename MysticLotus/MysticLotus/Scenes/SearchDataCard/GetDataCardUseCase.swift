//
//  GetDataCardUseCase.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 8/11/23.
//

import Foundation
import ScryfallKit
import Combine

protocol GetDataCardUseCaseProtocol {
    var searchDataCardRepository: DataCardRepositoryProtocol?
    { get }
    
    func searchCards(searchText: String) -> AnyPublisher<[MLCard], Never>
}

class GetDataCardUseCase: GetDataCardUseCaseProtocol {
    var searchDataCardRepository: DataCardRepositoryProtocol?
    
    init(searchDataCardRepository: DataCardRepositoryProtocol?) {
        self.searchDataCardRepository = searchDataCardRepository
    }
    
    func searchCards(searchText: String) -> AnyPublisher<[MLCard], Never> {
        guard let searchDataCardRepository =
                searchDataCardRepository else {
            return Just([]).eraseToAnyPublisher()
        }
        return searchDataCardRepository
            .searchCards(searchText: searchText)
            .eraseToAnyPublisher()
    }
}
