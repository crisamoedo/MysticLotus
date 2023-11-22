//
//  SearchDataCardCoordinator.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 13/11/23.
//

import UIKit

protocol SearchDataCardCoordinatorProtocol {
    func start()
    func build() -> UIViewController
    func goToCardDetail(with selectedCardData: MLCard)
}

// Singleton

class SearchDataCardCoordinator: SearchDataCardCoordinatorProtocol {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController?.pushViewController(build(), animated: true)
    }
    
    func build() -> UIViewController {
        let searchDataCardRepository = Assembly.shared.searchDataCardRepository
        let searchDataCardUseCase = GetDataCardUseCase(searchDataCardRepository: searchDataCardRepository)
        let dataCardViewController = SearchDataCardViewController()
        let searchDataCardViewModel = SearchDataCardViewModel(
            dataCardCoordinator: self,
            searchDataCardUseCase: searchDataCardUseCase,
            view: dataCardViewController)
        dataCardViewController.viewModel = searchDataCardViewModel
        
        return dataCardViewController
    }
    func goToCardDetail(with selectedCardData: MLCard) {
        let cardDetailCoordinator = CardDetailCoordinator(navigationController: navigationController, card: selectedCardData)
        cardDetailCoordinator.start()
    }
}
