import Foundation
import ScryfallKit
import Combine

protocol RandomCardRepositoryProtocol {
    func getRandomCard() -> AnyPublisher<MLCard?, Never>
}

class RandomCardRepository: RandomCardRepositoryProtocol {
    func getRandomCard() -> AnyPublisher<MLCard?, Never> {
        return Future { promise in
            ScryfallClient().getRandomCard { result in
                switch result {
                case .success(let card):
                    promise(.success(MLCard(
                        name: card.name,
                        manaCost: card.manaCost,
                        typeLine: card.typeLine,
                        flavorText: card.flavorText,
                        artist: card.artist,
                        setName: card.setName)))
                case .failure:
                    promise(.success(nil))
                }
            }
        }.eraseToAnyPublisher()
    }
}
