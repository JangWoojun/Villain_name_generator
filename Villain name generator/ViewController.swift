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
    
    var length = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        print(lengthStepper.value)
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
        
        lengthStepper.value = 12.0
    }
    
    func createName() -> String {
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
        
        return villainName
    }
    
    
    @IBAction func lengthStepper(_ sender: UIStepper) {
        length = Int(sender.value)
        lengthLabel.text = "\(length)자리"
    }
    
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        if !lengthSwitch.isOn {
            
            let villainName = createName()
            
            nameLabel.text = villainName
            
        } else {
            var villainName: String
            while true {
                villainName = createName()
                
                if villainName.count <= length && villainName != nameLabel.text! {
                    nameLabel.text = villainName
                    break
                }
            }
        }
    }
    
    
    @IBAction func lengthSwitchChanged(_ sender: UISwitch) {
        addressTextField.text = ""
        nameTextField.text = ""
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (addressTextField.text?.count)! + (nameTextField.text?.count)! + string.count >= length {
            return false
        } else {
            return true
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
