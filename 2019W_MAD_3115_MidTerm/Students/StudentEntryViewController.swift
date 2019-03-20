//
//  StudentEntryViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentEntryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(movetoLogin))
        // Do any additional setup after loading the view.
    }
    @objc func movetoLogin(){
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "Login")
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    

  

}
