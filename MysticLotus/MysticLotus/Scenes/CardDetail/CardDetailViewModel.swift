//
//  CardDetailViewModel.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 15/11/23.
//

import Foundation
import ScryfallKit
import Combine

protocol CardDetailViewModelProtocol {
    var cardDetail: MLCard {get}
    var cardRulings: [MLRulingsCard] {get}
    var view: CardDetailViewControllerProtocol? {get}
    var fieldsSections: [FieldsSection] {get}
    
    func viewDidLoad()
    
}

class CardDetailViewModel: CardDetailViewModelProtocol {
    
    var cardDetail: MLCard
    var cardRulings: [MLRulingsCard] = []
    var view: CardDetailViewControllerProtocol?
    private var cancellables: [AnyCancellable] = []
    private let cardDetailUseCase:
    CardDetailUseCaseProtocol?
    var fieldsSections: [FieldsSection] {
        let rulings = cardRulings.map{ ruling in
            Field(title: ruling.releasedAt, value: ruling.comment)
        }
        let cardFields: [Field] = [
            Field(title: "Card name: ", value: cardDetail.name),
            Field(title: "Mana Cost: ", value: cardDetail.manaCost),
            Field(title: "Type line: ", value: cardDetail.typeLine),
            Field(title: "Flavor text: ", value: cardDetail.flavorText),
            Field(title: "Artist: ", value: cardDetail.artist),
            Field(title: "Set name: ", value: cardDetail.setName)
        ]
        var sections = [
            FieldsSection(title: "Card", fields: cardFields)
        ]
       
        if !rulings.isEmpty {
            sections.append(FieldsSection(title: "Rulings", fields: rulings))
        }
        return sections
    }
    
    private let cardDetailCoordinator: CardDetailCoordinatorProtocol
    
    init(cardDetailCoordinator: CardDetailCoordinatorProtocol,
         cardDetailUseCase: CardDetailUseCase,
         view: CardDetailViewControllerProtocol?,
         card: MLCard) {
        
        self.cardDetailCoordinator = cardDetailCoordinator
        self.cardDetailUseCase = cardDetailUseCase
        self.view = view
        self.cardDetail = card
    }
    
    func viewDidLoad() {
        cardDetailUseCase?.getRulings(id: .scryfallID(id: cardDetail.id))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] rulings in
                self?.cardRulings = rulings
                self?.view?.reloadTable()
            }.store(in: &cancellables)
    }
}
