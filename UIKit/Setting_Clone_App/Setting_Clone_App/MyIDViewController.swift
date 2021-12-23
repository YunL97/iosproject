//
//  MyIDViewController.swift
//  Setting_Clone_App
//
//   Created by 이윤식 on 2021/12/21.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!{
        didSet{
            nextButton.isEnabled = false
        }
    }
    @IBAction func doCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //  nextButton.isEnabled = false
        //  textFieldDidchange(sender: emailTextField)
        emailTextField.addTarget(self, action: #selector(textFieldDidchange), for: .editingChanged)
        
        // Do any additional setup after loading the view.

    }
    
    @objc func textFieldDidchange(sender: UITextField) {
//        print(sender.text ?? "")
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
        }else {
            nextButton.isEnabled = true
        }
    }



}
