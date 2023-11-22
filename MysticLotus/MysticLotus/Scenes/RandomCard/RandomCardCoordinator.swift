//
//  RandomCardCoordinator.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 13/11/23.
//

import UIKit

protocol RandomCardCoordinatorProtocol {
    func start()
    func build() -> UIViewController
    func goToCardDetail(with selectedRandomCard: MLCard)
}

// Singleton

class RandomCardCoordinator: RandomCardCoordinatorProtocol {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController?.pushViewController(build(), animated: true)
    }
    
    func build() -> UIViewController {
        let randomCardRepository = Assembly.shared.randomCardRepository
        let randomCardUseCase = GetRandomCardUseCase(randomCardRepository: randomCardRepository)
        let randomCardViewController = RandomCardViewController()
        let randomCardViewModel = RandomCardViewModel(
            randomCardCoordinator: self,
            randomCardUseCase: randomCardUseCase,
            view: randomCardViewController)
        randomCardViewController.viewModel = randomCardViewModel
        
        return randomCardViewController
    }
    
    func goToCardDetail(with selectedRandomCard: MLCard) {
        let cardDetailCoordinator = CardDetailCoordinator(navigationController: navigationController, card: selectedRandomCard)
        cardDetailCoordinator.start()
    }
}
