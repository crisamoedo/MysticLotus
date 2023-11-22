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
    func didSelectSet(_ selectedSetIndex: Int)
}

class SetListViewModel: SetListViewModelProtocol {
    
    var view: SetListViewControllerProtocol?
    var setList: [MLSet] = []
    
    private let setListCoordinator : SetListCoordinatorProtocol
    private let setListUseCase: GetSetUseCaseProtocol?
    private var cancellables: [AnyCancellable] = []
    
    init(setListCoordinator: SetListCoordinatorProtocol,
         setListUseCase: GetSetUseCaseProtocol?,
         view: SetListViewControllerProtocol?) {
        self.setListCoordinator = setListCoordinator
        self.setListUseCase = setListUseCase
        self.view = view
    }
    func didSelectSet(_ selectedSetIndex: Int) {
//        setListCoordinator
//            .goToSetDetail() [selectedSetIndex]
    }
}
