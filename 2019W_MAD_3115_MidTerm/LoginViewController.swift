//
//  ViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var rememberSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefault = UserDefaults.standard
        if let email = userDefault.string(forKey: "userEmail"){
            
        self.txtUsername.text = email
            if let pwd = userDefault.string(forKey: "userPassword"){
                self.txtPassword.text = pwd
            
            rememberSwitch.isOn = true
            }
            else{
                rememberSwitch.isOn = false
            }
            
        }
       
    }


    @IBAction func btnLoginClick(_ sender: Any) {
        
        let email = self.txtUsername.text
        let pwd = self.txtPassword.text
         let userDefault = UserDefaults.standard
        
        if(email == "admin" && pwd == "admin@123"){
            print("Login Successfully")
            if (rememberSwitch.isOn == true){
           
            userDefault.set(email, forKey: "userEmail")
            userDefault.set(pwd, forKey: "userPassword")
                let sb = UIStoryboard.init(name: "Main", bundle: nil)
                let rootVC = sb.instantiateViewController(withIdentifier: "StudentEntry")
                navigationController?.pushViewController(rootVC, animated: true)
        }
        else{
                print("Remove UserId/Password if previously remembered/stored")
                userDefault.removeObject(forKey: "userEmail")
                userDefault.removeObject(forKey: "userPassword")
        }
            
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let studentEntry = sb.instantiateViewController(withIdentifier: "StudentEntry")
           navigationController?.pushViewController(studentEntry, animated: true)
        
    }
}

}
