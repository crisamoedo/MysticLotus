

import UIKit

protocol RandomCardViewControllerProtocol {
    func updateRandomCardName(_ cardName: String)
}
class RandomCardViewController: UIViewController, RandomCardViewControllerProtocol {

    @IBOutlet weak var randomCardButton: UIButton!
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
    
    @IBAction func getRandomCardButton(_ sender: Any) {
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
