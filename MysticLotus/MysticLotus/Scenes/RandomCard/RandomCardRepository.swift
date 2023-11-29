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
                    promise(.success(MLCard(id: "\(card.id)",
                                            cardImageUris: card.imageUris,
                                            name:card.name.uppercased(),
                                            manaCost: card.manaCost?.filtrarNumeros(),
                                            typeLine: card.typeLine,
                                            flavorText: card.flavorText,
                                            artist: card.artist,
                                            setName: card.setName
                                           )))
                case .failure:
                    promise(.success(nil))
                }
            }
        }.eraseToAnyPublisher()
    }
}
