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

    public lazy var dataCardRepository: DataCardRepositoryProtocol = {
        DataCardRepository()
    }()
    
    public lazy var cardRulingsRepository: CardRulingsRepositoryProtocol = {
        CardRulingsRepository()
    }()
    
    public lazy var setDataRepository: 
        SetDataRepositoryProtocol = {
        SetDataRepository()
    }()
    
    public lazy var setDetailRepository:
        SetDetailRepositoryProtocol = {
        SetDetailRepository()
    }()
    
    private init() {}
}
