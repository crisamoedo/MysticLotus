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
    func didSelectSetCard(_ selectedSetCardIndex: Int)
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
    func getCards() {
        setDetailUseCase?
            .getCards()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] cards in
                self?.setDetail = cards
                self?.view?.reloadTable()
            }.store(in: &cancellables)
        
    }
    func didSelectSetCard(_ selectedSetCardIndex: Int) {
        setDetailCoordinator
            .goToCardDetail(with: setDetail[selectedSetCardIndex])
    }
    
   
}
