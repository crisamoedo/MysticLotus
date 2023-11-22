//
//  SelectedSetViewModel.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 15/11/23.
//

import Foundation
import ScryfallKit
import Combine

protocol SetDetailViewModelProtocol {
    var setDetail: MLSet? {get}
    var view: SetDetailViewControllerProtocol? {get}
}

class SetDetailViewModel: SetDetailViewModelProtocol {
    var setDetail: MLSet?
    var view: SetDetailViewControllerProtocol?
    
    //private let cardDetailCoordinator: SetDetailCoordinatorProtocol
    private var cancellables: [AnyCancellable] = []
    
    init(cardDetailCoordinator: CardDetailCoordinator,
         view: CardDetailViewControllerProtocol?) {
        //self.cardDetailCoordinator = cardDetailCoordinator
        //self.view = view
    }
}

