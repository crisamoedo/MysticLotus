//
//  SetListCoordinator.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 15/11/23.
//

import UIKit

protocol SetListCoordinatorProtocol {
    func start()
    func build() -> UIViewController
    func goToSetDetail(with selectedSet: MLSet)
}

// Singleton

class SetListCoordinator: SetListCoordinatorProtocol {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController?.pushViewController(build(), animated: true)
    }
    
    func build() -> UIViewController {
        let setDataRepository = Assembly.shared.setDataRepository
        let setListUseCase = SetListUseCase(setListRepository: setDataRepository)
        let setListViewController = SetListViewController()
        let setListViewModel = SetListViewModel(
            setListCoordinator: self,
            setListUseCase: setListUseCase,
            view: setListViewController)
        setListViewController.viewModel = setListViewModel
        
        return setListViewController
    }
    
    func goToSetDetail(with selectedSet: MLSet) {
        let setDetailCoordinator = SetDetailCoordinator(navigationController: navigationController, set: selectedSet)
                setDetailCoordinator.start()
    }
}

