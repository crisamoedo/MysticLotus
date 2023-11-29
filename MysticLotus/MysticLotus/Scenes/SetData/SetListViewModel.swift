//
//  SetListViewModel.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 15/11/23.
//

import Foundation
import ScryfallKit
import Combine

protocol SetListViewModelProtocol {
    var view: SetListViewControllerProtocol? { get }
    var setList: [MLSet] {get}
    func getSets()
    func didSelectSet(_ selectedSetIndex: Int)
}

class SetListViewModel: 
    SetListViewModelProtocol {
    
    var view: SetListViewControllerProtocol?
    var setList: [MLSet] = []
    
    private let setListCoordinator : SetListCoordinatorProtocol
    private let setListUseCase: SetListUseCaseProtocol?
    private var cancellables: [AnyCancellable] = []
    
    init(setListCoordinator: SetListCoordinatorProtocol,
         setListUseCase: SetListUseCaseProtocol?,
         view: SetListViewControllerProtocol?) {
        self.setListCoordinator = setListCoordinator
        self.setListUseCase = setListUseCase
        self.view = view
    }
    func getSets() {
        setListUseCase?
            .getSets()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] sets in
                self?.setList = sets
                self?.view?.reloadTable()
            }.store(in: &cancellables)
    }
    func didSelectSet(_ selectedSetIndex: Int) {
        setListCoordinator
            .goToSetDetail(with: setList[selectedSetIndex])
    }
}
