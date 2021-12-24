//
//  SignUPViewController.swift
//  ScreenNavigate
//
//  Created by senghong on 21/12/21.
//

import UIKit

class SignUPViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!{didSet{
        
        nameTextField.layer.cornerRadius = 20
        nameTextField.layer.masksToBounds = true
        nameTextField.setRightPaddingPoints(12)
        nameTextField.setLeftPaddingPoints(12)
    }}
    
    @IBOutlet weak var emailTextField: UITextField!{didSet{
        emailTextField.layer.cornerRadius = 20
        emailTextField.layer.masksToBounds = true
        emailTextField.setRightPaddingPoints(12)
        emailTextField.setLeftPaddingPoints(12)
    }}
    
    @IBOutlet weak var passwrodTextField: UITextField!{didSet{
        
        passwrodTextField.layer.cornerRadius = 20
        passwrodTextField.layer.masksToBounds = true
        passwrodTextField.setLeftPaddingPoints(12)
        passwrodTextField.setRightPaddingPoints(12)
        
    }}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.backButtonTitle = ""
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
    }
    
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -290 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
    
    
    @IBAction func BackToSignIn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let signupScreen = segue.destination as? CreatedAccountViewController {
            guard let name = nameTextField.text, let email = emailTextField.text,
                  let password = passwrodTextField.text
            else{
                return
            }
            
            guard !email.isEmpty, !password.isEmpty, !name.isEmpty else{
                
                let alertController = UIAlertController(title: "Error", message: "Please fill all the fields", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: {
                    _ in
                }))
                present(alertController, animated: true, completion: nil)
                return
            }
            
            signupScreen.user = User(name: name, email: email, password: password)
        }
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    /*
    // MARK: - Navigation

    
     
     
     
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


