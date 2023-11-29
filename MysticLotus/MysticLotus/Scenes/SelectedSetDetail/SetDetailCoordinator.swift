//
//  SelectedSetCoordinator.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 15/11/23.
//

import UIKit

protocol SetDetailCoordinatorProtocol {
    func start()
    func build() -> UIViewController
    func goToCardDetail(with selectedSet: MLCard)
}

class SetDetailCoordinator: SetDetailCoordinatorProtocol {
    weak var navigationController: UINavigationController?
    var set: MLSet
    
    init(navigationController: UINavigationController?, set: MLSet) {
        self.navigationController = navigationController
        self.set = set
    }
    
    func start() {
        navigationController?.pushViewController(build(), animated: true)
    }
    
    func build() -> UIViewController {
        let setDetailRepository = Assembly.shared.setDetailRepository
        let setDetailUseCase =
        SetDetailUseCase(setDetailRepository: setDetailRepository)
        let setDetailViewController = SetDetailViewController()
        let setDetailViewModel = SetDetailViewModel(setDetailCoordinator: self, setDetailUseCase: setDetailUseCase, view: setDetailViewController)
        setDetailViewController.viewModel = setDetailViewModel
        return setDetailViewController
    }
    func goToCardDetail(with selectedSet: MLCard) {
        let cardDetailCoordinator = CardDetailCoordinator(navigationController: navigationController, card: selectedSet)
        cardDetailCoordinator.start()
    }
}
