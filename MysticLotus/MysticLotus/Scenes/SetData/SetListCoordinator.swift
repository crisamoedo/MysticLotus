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
//        let setListRepository = Assembly.shared.setListRepository
//        let setListUseCase = GetSetUseCase(setListRepository: setListRepository)
//        let setListViewController = SetListViewController()
//        let setListViewModel = SetListViewModel(
//            setListCoordinator: self,
//            setListUseCase: setListUseCase,
//            view: setListViewController)
//        setListViewController.viewModel = setListViewModel
//        
//        return setListViewController
        return UIViewController()
    }
    
    //FALTA IMPLEMENTAR LAS CLASES DE LA LISTA DE CARTAS DE UN SET
    func goToSetDetail(with selectedSet: MLSet) {
//        let setDetailCoordinator = SetDetailCoordinator(navigationController: navigationController, set: selectedSet)
//        setDetailCoordinator.start()
    }
}

