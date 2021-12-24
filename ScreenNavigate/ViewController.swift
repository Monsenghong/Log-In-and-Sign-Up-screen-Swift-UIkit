//
//  ViewController.swift
//  ScreenNavigate
//
//  Created by senghong on 21/12/21.
//

import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

class ViewController: UIViewController ,UITextFieldDelegate {

    
   
    @IBOutlet weak var emailTextField: UITextField!{didSet{
        
        emailTextField.layer.cornerRadius = 20
        emailTextField.layer.masksToBounds = true
        emailTextField.setRightPaddingPoints(12)
        emailTextField.setLeftPaddingPoints(12)
    }}
    
    @IBOutlet weak var passwordTextField: UITextField!{didSet{
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.layer.masksToBounds = true
        passwordTextField.setRightPaddingPoints(12)
        passwordTextField.setLeftPaddingPoints(12)
    }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        
        
      
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        

        
        // Do any additional setup after loading the view.
        
    }
    
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -290 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool

        {

            if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {

                emailTextField.becomeFirstResponder()

            } else {

                passwordTextField.resignFirstResponder()

                return true;

            }

            return false

        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let firstScreen = segue.destination as? LoginSuccessViewController{
            
            guard let email = emailTextField.text , let password = passwordTextField.text else{
                return
            }
            
            guard !email.isEmpty, !password.isEmpty else {
                let alertController = UIAlertController(title: "Error", message: "Your need to fill out all the fields", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
                    
                }))
                present(alertController, animated: true, completion: nil)
                return
            }
            
            
            firstScreen.user = User(email: email, password: password)
        }
    
    
    
    
    
    
    }
    
   

}





    
    




