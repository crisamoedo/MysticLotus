//
//  CardDetailViewController.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 14/11/23.
//

import UIKit

protocol  CardDetailViewControllerProtocol {
}

class CardDetailViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, CardDetailViewControllerProtocol {
    
    var viewModel : CardDetailViewModelProtocol?
    
    @IBOutlet weak var dataCardTable: UITableView!
    @IBOutlet weak var nameCardLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    init() {
        super.init(nibName: "CardDetailView", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dataCardTable.register(UINib(nibName: "DataCardCell", bundle: .main), forCellReuseIdentifier: "DataCardCell")
        nameCardLabel.text = viewModel?.cardDetail.name
        dataCardTable.delegate = self
        dataCardTable.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.fieldsSections.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.fieldsSections[section].fields.count ?? 0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel?.fieldsSections[section].title
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = dataCardTable.dequeueReusableCell(withIdentifier: "DataCardCell" , for : indexPath) as? DataCardCell,
              let field = viewModel?.fieldsSections[indexPath.section].fields[indexPath.row] else {
            return UITableViewCell()
        }
        cellData.typeDataLabel.text = field.title
        cellData.dataCardLabel.text = field.value
      
        return cellData
        
    }
    
}
