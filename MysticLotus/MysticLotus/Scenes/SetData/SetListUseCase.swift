//
//  SetListUseCase.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 21/11/23.
//

import Foundation
import ScryfallKit
import Combine

protocol GetSetUseCaseProtocol {
    var setListRepository: SetDataRepository?
    { get }
    
    func getSets() -> AnyPublisher<[MLSet], Never>
}

class GetSetUseCase: GetSetUseCaseProtocol {
    var setListRepository: SetDataRepository?
    
    init(setListRepository: SetDataRepository?) {
        self.setListRepository = setListRepository
    }
    
    func getSets() -> AnyPublisher<[MLSet], Never> {
        guard let setListRepository =
                setListRepository else {
            return Just([]).eraseToAnyPublisher()
        }
        return
        setListRepository
            .getSets()
            .eraseToAnyPublisher()
            
    }
}

