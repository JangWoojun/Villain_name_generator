import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lengthSwitch: UISwitch!
    
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var lengthStepper: UIStepper!
    
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var exAddressLabel: UILabel!
    @IBOutlet weak var exNameLabel: UILabel!
    @IBOutlet weak var exVillainNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        addressTextField.delegate = self
        nameTextField.delegate = self
        
        createButton.layer.cornerRadius = 10
        createButton.layer.borderWidth = 5
        createButton.layer.borderColor = UIColor.systemGray2.cgColor
        
        addressTextField.layer.borderColor = UIColor.systemGray2.cgColor
        addressTextField.layer.borderWidth = 5
        addressTextField.layer.cornerRadius = 10
        
        nameTextField.layer.borderColor = UIColor.systemGray2.cgColor
        nameTextField.layer.borderWidth = 5
        nameTextField.layer.cornerRadius = 10
        
        exNameLabel.clipsToBounds = true
        exAddressLabel.clipsToBounds = true
        exVillainNameLabel.clipsToBounds = true
        exAddressLabel.layer.cornerRadius = 10
        exNameLabel.layer.cornerRadius = 10
        exVillainNameLabel.layer.cornerRadius = 10
    }

}
