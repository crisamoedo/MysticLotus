//
//  SelectedSetUseCase.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 28/11/23.
//

import Foundation
import ScryfallKit
import Combine


import Foundation
import ScryfallKit
import Combine

protocol SetDetailUseCaseProtocol {
    var setDetailRepository: SetDetailRepositoryProtocol?
    { get }
    func getCards() -> AnyPublisher<[MLCard], Never>
}

class SetDetailUseCase: SetDetailUseCaseProtocol {
    var setDetailRepository: SetDetailRepositoryProtocol?
    
    init(setDetailRepository: SetDetailRepositoryProtocol?) {
        self.setDetailRepository = setDetailRepository
    }
    
    func getCards() -> AnyPublisher<[MLCard], Never> {
        guard let setDetailRepository =
                setDetailRepository else {
            return Just([]).eraseToAnyPublisher()
        }
        return setDetailRepository
            .getCardsSet()
            .eraseToAnyPublisher()
            
    }
}


