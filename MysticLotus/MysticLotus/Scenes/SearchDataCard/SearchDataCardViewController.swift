//
//  SearchDataCardViewController.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 8/11/23.
//

import UIKit
import ScryfallKit

protocol SearchDataCardViewControllerProtocol {
    func reloadTable()
}

class SearchDataCardViewController: UIViewController {
    @IBOutlet weak var searchCardTF: UITextField!
    @IBOutlet weak var listCardsTableView: UITableView!
    
    var viewModel: SearchDataCardViewModelProtocol?
    
    init() {
        super.init(nibName: "SearchDataCardView", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCardsTableView.register(UINib(nibName: "CardCell", bundle: .main), forCellReuseIdentifier: "CardCell")
        listCardsTableView.delegate = self
        listCardsTableView.dataSource = self
        listCardsTableView.reloadData()
        
        searchCardTF.addFindImageTF(ImageViewNamed: "search")
    }
    
    @IBAction func didTapOnSearchCards(_ sender: UIButton) {
        guard let introducedText = searchCardTF.text else {
            return
        }
        viewModel?.didTapOnSearchCards(searchText: introducedText)
    }
}

// MARK: - SearchDataCardViewControllerProtocol
extension SearchDataCardViewController: SearchDataCardViewControllerProtocol {
    func reloadTable() {
        listCardsTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension SearchDataCardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.searchedCards.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataCardName = listCardsTableView.dequeueReusableCell(withIdentifier: "CardCell" , for : indexPath) as? CardCell,
              let card = viewModel?.searchedCards[indexPath.row] else {
            return UITableViewCell()
        }
        dataCardName.cardNameLabel?.text = card.name
        return dataCardName
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectCard(indexPath.row)
    }
}
