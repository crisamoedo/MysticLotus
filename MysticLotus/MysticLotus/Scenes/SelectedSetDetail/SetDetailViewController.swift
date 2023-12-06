//
//  SelectedSetViewController.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 15/11/23.
//

import UIKit
import ScryfallKit

protocol  SetDetailViewControllerProtocol {
    func reloadTable()
}

class SetDetailViewController : UIViewController {
    
    var viewModel : SetDetailViewModelProtocol?
    
    
    @IBOutlet weak var dataSetTable: UITableView!
    
    init() {
        super.init(nibName: "SelectedSetView", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSetTable.register(UINib(nibName: "SetCardCell", bundle: .main), forCellReuseIdentifier: "SetCardCell")
        dataSetTable.delegate = self
        dataSetTable.dataSource = self
        dataSetTable.reloadData()
        viewModel?.getCards()
    }
}
    // MARK: - SearchDataCardViewControllerProtocol
    extension SetDetailViewController: SetDetailViewControllerProtocol {
        func reloadTable() {
            dataSetTable.reloadData()
        }
    }
    // MARK: - UITableViewDataSource, UITableViewDelegate
    extension SetDetailViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            viewModel?.setDetail.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let setListCards = dataSetTable.dequeueReusableCell(withIdentifier: "SetCardCell" , for : indexPath) as? SetCardCell,
                  let card = viewModel?.setDetail[indexPath.row] else {
                return UITableViewCell()
            }
            setListCards.setCardsName.text = card.name
           
            return setListCards
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            viewModel?.didSelectSetCard(indexPath.row)
        }
}
