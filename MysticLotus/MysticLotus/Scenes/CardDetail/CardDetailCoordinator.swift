//
//  CardDetailCoordinator.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 13/11/23.
//


import UIKit

protocol CardDetailCoordinatorProtocol {
    func start()
    func build() -> UIViewController
}

class CardDetailCoordinator: CardDetailCoordinatorProtocol {
    weak var navigationController: UINavigationController?
    var card: MLCard

    init(navigationController: UINavigationController?, card: MLCard) {
        self.navigationController = navigationController
        self.card = card
    }
    
    func start() {
        navigationController?.pushViewController(build(), animated: true)
    }
    
    func build() -> UIViewController {
        let cardDetailRepository = Assembly.shared.cardRulingsRepository
        let cardDetailUseCase = CardDetailUseCase(cardDetailRepository: cardDetailRepository)
        let cardDetailViewController = CardDetailViewController()
        let cardDetailViewModel = CardDetailViewModel(cardDetailCoordinator: self, cardDetailUseCase: cardDetailUseCase, view: cardDetailViewController, card: card)
        cardDetailViewController.viewModel = cardDetailViewModel
        return cardDetailViewController
    }
}
