//
//  ViewController.swift
//  SnapChatBasicClone
//
//  Created by Semih Kalaycı on 27.08.2021.
//

import UIKit
import Firebase



class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func SignInClicked(_ sender: Any) {
        if  passwordTF.text != "" && emailTF.text != ""{
            Auth.auth().signIn(withEmail: self.emailTF.text!, password: self.passwordTF.text!) { auth, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            makeAlert(title: "Error", message: "Username/Password/Email can not be null")
        }
        
        
        
    }
    @IBAction func SignUpClicked(_ sender: Any) {
        if userNameTF.text != "" && passwordTF.text != "" && emailTF.text != ""{
            
            Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { auth, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error" )
                }else{
                    
                    let fireStore = Firestore.firestore()
                    
                    let userDictionary = ["email":self.emailTF.text!,"username":self.userNameTF.text!] as [String:Any]
                    
                    fireStore.collection("userInfo").addDocument(data: userDictionary) { error in
                        if error != nil {
                            
                        }
                    }
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else{
            makeAlert(title: "Error", message: "Username/Password/Email can not be null")
        }
    }
    
    
    func makeAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okBtn = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    
        
    }
    
    

}

