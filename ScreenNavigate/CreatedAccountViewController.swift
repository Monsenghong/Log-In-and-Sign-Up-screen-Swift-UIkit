//
//  CreatedAccountViewController.swift
//  ScreenNavigate
//
//  Created by senghong on 23/12/21.
//

import UIKit

class CreatedAccountViewController: UIViewController {

    var user : User!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = "Your name is :\(user.name ?? "")"
        emailLabel.text = "Your email is:\(user.email)"
        passwordLabel.text = "Your password is:\(user.password)"
        
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
