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
    var view: SetDetailViewControllerProtocol? {get}
    var setDetail: [MLCard] {get}
    func getCards()
    func didSelectSetCard(_ selectedCardCardIndex: Int)
}

class SetDetailViewModel: SetDetailViewModelProtocol {
    
    var view: SetDetailViewControllerProtocol?
    var setDetail: [MLCard] = []
    
    private let setDetailCoordinator: SetDetailCoordinatorProtocol
    private let setDetailUseCase:
    SetDetailUseCaseProtocol?
    private var cancellables: [AnyCancellable] = []
    
    init(setDetailCoordinator: SetDetailCoordinatorProtocol,
         setDetailUseCase: SetDetailUseCaseProtocol?,
         view: SetDetailViewControllerProtocol?){
        self.setDetailCoordinator = setDetailCoordinator
        self.setDetailUseCase = setDetailUseCase
        self.view = view
    }
    func didSelectSetCard(_ selectedSetCardIndex: Int) {
        setDetailCoordinator
            .goToCardDetail(with: setDetail[selectedSetCardIndex])
    }
    
    func getCards() {
    }
}
