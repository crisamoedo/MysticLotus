

import Foundation
import ScryfallKit
import Combine

protocol GetRandomCardUseCaseProtocol {
    var randomCardRepository: RandomCardRepositoryProtocol? { get }
    
    func getRandomCard() -> AnyPublisher<MLCard?, Never>
}

class GetRandomCardUseCase: GetRandomCardUseCaseProtocol {
    var randomCardRepository: RandomCardRepositoryProtocol?
    
    init(randomCardRepository: RandomCardRepositoryProtocol?) {
        self.randomCardRepository = randomCardRepository
    }
    
    func getRandomCard() -> AnyPublisher<MLCard?, Never> {
        guard let randomCardRepository = randomCardRepository else {
            return Just(nil).eraseToAnyPublisher()
        }
        
        return randomCardRepository.getRandomCard()
            .eraseToAnyPublisher()
    }
}
