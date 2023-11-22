//
//  SelectedSetViewController.swift
//  MysticLotus
//
//  Created by Cristina Amoedo Fragueiro on 15/11/23.
//

import UIKit

protocol  SetDetailViewControllerProtocol {
}

class SetDetailViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, SetDetailViewControllerProtocol {
    
    var viewModel : SetDetailViewModelProtocol?
    
 
    @IBOutlet weak var dataSetTable: UITableView!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var setNameLabel: UILabel!
    @IBOutlet weak var numberOfCardsLabel: UILabel!
    
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataCardDetailTitles.count
      
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = dataSetTable.dequeueReusableCell(withIdentifier: "SetCardCell" , for : indexPath) as? SetCardCell
        else {
            return UITableViewCell()
        }
        //aquí irían los nombres de cada una de las cartas del set
        cellData.setCardsName.text = dataCardDetailTitles[indexPath.row]
           
        return cellData
        
    }
    
}
