//
//  CardDetailViewController.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 14/11/23.
//

import UIKit

protocol  CardDetailViewControllerProtocol {
    func reloadTable()
}

class CardDetailViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, CardDetailViewControllerProtocol {
    
    var viewModel : CardDetailViewModelProtocol?
    
    @IBOutlet weak var dataCardTable: UITableView!
    @IBOutlet weak var cardImage: UIImageView!
    
    init() {
        super.init(nibName: "CardDetailView", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        dataCardTable.register(UINib(nibName: "DataCardCell", bundle: .main), forCellReuseIdentifier: "DataCardCell")
        if let cardImageURL = viewModel?.cardDetail.cardImage {
            if let url = URL(string: cardImageURL) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url),
                       let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.cardImage.image = image
                        }
                    }
                }
            }
        }
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
    func reloadTable(){
        dataCardTable.reloadData()
    }
    
}
