//
//  Assembly.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 13/11/23.
//

import Foundation

class Assembly {
    
    public static var shared = Assembly()
    
    public lazy var randomCardRepository: RandomCardRepositoryProtocol = {
        RandomCardRepository()
    }()

    public lazy var searchDataCardRepository: CardDataRepositoryProtocol = {
        SearchDataCardRepository()
    }()
    
    public lazy var setListRepository: SetDataRepositoryProtocol = {
        SetDataRepository()
    }()
    private init() {}
}
