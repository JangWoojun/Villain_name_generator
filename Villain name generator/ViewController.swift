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
        addressTextField.attributedPlaceholder = NSAttributedString(string: "거주지(선택)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        addressTextField.addLeftPadding()
        
        nameTextField.layer.borderColor = UIColor.systemGray2.cgColor
        nameTextField.layer.borderWidth = 5
        nameTextField.layer.cornerRadius = 10
        nameTextField.attributedPlaceholder = NSAttributedString(string: "이름", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        nameTextField.addLeftPadding()
        
        exNameLabel.clipsToBounds = true
        exAddressLabel.clipsToBounds = true
        exVillainNameLabel.clipsToBounds = true
        exAddressLabel.layer.cornerRadius = 10
        exNameLabel.layer.cornerRadius = 10
        exVillainNameLabel.layer.cornerRadius = 10
        
    }
    
    
    @IBAction func lengthStepper(_ sender: UIStepper) {
        lengthLabel.text = "\(Int(sender.value))자리"
    }
    
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        if !lengthSwitch.isOn {
            
            var villainName = ""
            
            let myLocation = addressTextField.text ?? ""
            let myName = nameTextField.text ?? ""
            
            villainName += myLocation
            
            let locationNum = Int.random(in: 0...1)
            let location = locationNum == 0 ? locations[0][Int.random(in: 0..<71)] : locations[1][Int.random(in: 0..<40)]
            
            villainName += location
            villainName += locationNum == 0 ? "" : specificLocations[location]!
            
            let jobNum = Int.random(in: 0...1)
            let job = jobNum == 0 ? jobs[0][Int.random(in: 0..<18)] : jobs[1][Int.random(in: 0..<23)]
            let object = jobNum == 0 ? objects[Int.random(in: 0..<58)] : ""
            
            villainName += object
            villainName += job
            
            villainName += myName
            
            nameLabel.text = villainName
            
        } else {
            
            
            
        }
    }
    
}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
