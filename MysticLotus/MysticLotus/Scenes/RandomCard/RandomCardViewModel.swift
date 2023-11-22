
import Foundation
import ScryfallKit
import Combine


protocol RandomCardViewModelProtocol {
    var view: RandomCardViewControllerProtocol? { get }
    var randomCard: MLCard? {get}
    
    func userDidTapRandomCardButton()
    func didSelectedRandomCard()
}

class RandomCardViewModel: RandomCardViewModelProtocol {
    
    var view: RandomCardViewControllerProtocol?
    var randomCard: MLCard?
    
    private let randomCardCoordinator: RandomCardCoordinatorProtocol
    private let randomCardUseCase: GetRandomCardUseCaseProtocol
    private var cancellables: [AnyCancellable] = []
    
    init(randomCardCoordinator: RandomCardCoordinatorProtocol,
         randomCardUseCase: GetRandomCardUseCaseProtocol,
         view: RandomCardViewControllerProtocol?) {
        self.randomCardCoordinator = randomCardCoordinator
        self.randomCardUseCase = randomCardUseCase
        self.view = view
    }
    
    func userDidTapRandomCardButton() {
        randomCardUseCase
            .getRandomCard()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] card in
                guard let card = card else {
                    self?.view?.updateRandomCardName("An error has ocurred")
                    return
                }
                self?.randomCard = card
                self?.view?.updateRandomCardName(card.name)
            }.store(in: &cancellables)
    }
    func didSelectedRandomCard() {
        guard let card = randomCard else {
            return
        }
        randomCardCoordinator.goToCardDetail(with: card)
    }
}
