//
//  SearchDataCardViewModel.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 8/11/23.
//


import Foundation
import ScryfallKit
import Combine

protocol SearchDataCardViewModelProtocol {
    var view: SearchDataCardViewControllerProtocol? { get }
    var searchedCards: [MLCard] {get}
    func didTapOnSearchCards(searchText: String)
    func didSelectCard(_ selectedCardIndex: Int)
}

class SearchDataCardViewModel: SearchDataCardViewModelProtocol {
  
    var view: SearchDataCardViewControllerProtocol?
    var searchedCards: [MLCard] = []
    
    private let dataCardCoordinator: SearchDataCardCoordinatorProtocol
    private let searchDataCardUseCase: GetDataCardUseCaseProtocol?
    private var cancellables: [AnyCancellable] = []
    
    init(dataCardCoordinator: SearchDataCardCoordinatorProtocol,
         searchDataCardUseCase: GetDataCardUseCaseProtocol?,
         view: SearchDataCardViewControllerProtocol?) {
        self.dataCardCoordinator = dataCardCoordinator
        self.searchDataCardUseCase = searchDataCardUseCase
        self.view = view
        
    }
        
    func didTapOnSearchCards(searchText: String) {
        searchDataCardUseCase?
            .searchCards(searchText: searchText)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] cards in
                self?.searchedCards = cards
                self?.view?.reloadTable()
            }.store(in: &cancellables)
    }
    
    func didSelectCard(_ selectedCardIndex: Int) {
        dataCardCoordinator
            .goToCardDetail(with: searchedCards[selectedCardIndex])
    }
}


