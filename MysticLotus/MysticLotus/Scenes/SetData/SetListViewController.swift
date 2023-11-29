//
//  SetListViewController.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 15/11/23.
//

import UIKit
import ScryfallKit

protocol SetListViewControllerProtocol {
    func reloadTable()
}

class SetListViewController : UIViewController {
    
    @IBOutlet weak var setListTable: UITableView!
    @IBOutlet weak var numberOfCardsInSetLabel: UILabel!
    @IBOutlet weak var setNameLabel: UILabel!
    var viewModel: SetListViewModelProtocol?
    
    init() {
        super.init(nibName: "SetListView", bundle: .main)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setListTable.register(UINib(nibName: "DataCardCell", bundle: .main), forCellReuseIdentifier: "DataCardCell")
        setListTable
            .delegate = self
        setListTable.dataSource = self
        setNameLabel.text = "Set name"
        numberOfCardsInSetLabel.text = "Nº Cards"
        setListTable.reloadData()
        viewModel?.getSets()
    }
    
}
    // MARK: - SearchDataCardViewControllerProtocol
    extension SetListViewController: SetListViewControllerProtocol {
        func reloadTable() {
            setListTable.reloadData()
        }
    }

    // MARK: - UITableViewDataSource, UITableViewDelegate
    extension SetListViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            viewModel?.setList.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let setListData = setListTable.dequeueReusableCell(withIdentifier: "DataCardCell" , for : indexPath) as? DataCardCell,
                  let set = viewModel?.setList[indexPath.row] else {
                return UITableViewCell()
            }
            //se está utilizando la celda modelo de DataCardCell para rellenar la tabla de sets
            setListData.typeDataLabel.text = set.name
            setNameLabel.text = set.name
            print(set.name)
            setListData.dataCardLabel.text =
            "\(set.cardCount)"
            return setListData
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            viewModel?.didSelectSet(indexPath.row)
        }
    }
