//
//  third_signup.swift
//  test
//
//  Created by 황견주 on 2018. 9. 7..
//  Copyright © 2018년 Kyun Joo, Hwang. All rights reserved.
//

import UIKit

class third_signup: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var TelTextField: UITextField! {
        didSet {
            TelTextField?.addDoneCancelToolbar(
                onDone: (target: self, action: #selector(TelTextDone)))
        }
    }
    @IBOutlet weak var BlogTextField: UITextField!
    @IBOutlet weak var TextBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == NameTextField {
            EmailTextField.becomeFirstResponder()
        } else if textField == EmailTextField {
            PasswordTextField.becomeFirstResponder()
        } else if textField == PasswordTextField {
            TelTextField.becomeFirstResponder()
        } else if textField == TelTextField {
            TelTextField.resignFirstResponder()
            BlogTextField.becomeFirstResponder()
        }
        return true
    }
    
    @IBAction func SingupAction(_ sender: UIButton) {
        TextBox.text = NameTextField.text! + " 님 가입을 축하합니다!!"
    }
    
    @objc func TelTextDone() -> Bool {
        return textFieldShouldReturn(TelTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
