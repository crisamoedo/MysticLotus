

import UIKit

protocol RandomCardViewControllerProtocol {
    func updateRandomCardName(_ cardName: String)
}
class RandomCardViewController: UIViewController, RandomCardViewControllerProtocol{

    @IBOutlet weak var cardNameButton: UIButton!
    var viewModel: RandomCardViewModelProtocol?
    
    init() {
        super.init(nibName: "RandomCardView", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        viewModel?.userDidTapRandomCardButton()
        }

    @IBAction func cardNameButtonAction(_ sender: UIButton) {
        viewModel?.didSelectedRandomCard()
    }
    
    func updateRandomCardName(_ cardName: String) {
        DispatchQueue.main.async { [weak self] in
            self?.cardNameButton.setTitle(cardName, for: .normal)
        }
    }
}
