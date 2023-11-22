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
    
    //var viewModel = SetListViewModelProtocol?
    
    init() {
        super.init(nibName: "SetListView", bundle: .main)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setListTable.register(UINib(nibName: "SetDataCell", bundle: .main), forCellReuseIdentifier: "SetDataCell")
        setListTable
            .delegate = self
        setListTable.dataSource = self
        setListTable.reloadData()
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
            0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            guard let setListName = setListTable.dequeueReusableCell(withIdentifier: "SetDataCell" , for : indexPath) as? SetDataCell,
//                  
//            else {
//                return UITableViewCell()
//            }
//            setListName.setNameLabel = set.name
//            return setListName
            return UITableViewCell()
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        }
    }
