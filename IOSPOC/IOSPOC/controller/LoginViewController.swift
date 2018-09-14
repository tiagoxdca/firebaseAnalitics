//
//  LoginViewController.swift
//  IOSPOC
//
//  Created by Tiago Almeida on 13/09/2018.
//  Copyright © 2018 Tiago Almeida. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goToHomeScreen(_ sender: Any) {
        Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassword.text!) { (user, error) in
            if error != nil {
                self.showErrorMessage()
            } else{
                self.performSegue(withIdentifier: "loginToHomeScreen", sender: self)
            }
        }
        
    }
    
    func showErrorMessage(){
        let alertController = UIAlertController(title: "Error Message", message: "Your credentials are wrong...", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    

}
