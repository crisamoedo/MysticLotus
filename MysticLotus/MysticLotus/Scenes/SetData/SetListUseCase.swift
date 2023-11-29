//
//  SetListUseCase.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 21/11/23.
//

import Foundation
import ScryfallKit
import Combine

protocol SetListUseCaseProtocol {
    var setListRepository: SetDataRepositoryProtocol?
    { get }
    func getSets() -> AnyPublisher<[MLSet], Never>
}

class SetListUseCase: SetListUseCaseProtocol {
    var setListRepository: SetDataRepositoryProtocol?
    
    init(setListRepository: SetDataRepositoryProtocol?) {
        self.setListRepository = setListRepository
    }
    
    func getSets() -> AnyPublisher<[MLSet], Never> {
        guard let setListRepository =
                setListRepository else {
            return Just([]).eraseToAnyPublisher()
        }
        return setListRepository
            .getSets()
            .eraseToAnyPublisher()
            
    }
}

