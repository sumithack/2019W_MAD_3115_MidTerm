//
//  StudentEntryViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentEntryViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
   
    @IBOutlet weak var stdEmail: UITextField!
    @IBOutlet weak var stdGender: UITextField!
    @IBOutlet weak var stdId: UITextField!
    @IBOutlet weak var stdName: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var bdate: UITextField!
    let courseName = ["MadT", "MODT", "CSD", "WADT" ]
    var studentName: [Student]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(movetoLogin))
        // Do any additional setup after loading the view.
        
    }

    @IBAction func btnSubmit(_ sender: UIButton) {
        if((stdId.text?.lowercased().verifyID())!){
            if(stdName.text!.count > 0){
                if(stdEmail.text!.verifyEmail()){
                    
                    self.performSegue(withIdentifier: "Result", sender: self)
                }
                else{
                    let alert = UIAlertController(title: "Error", message: "email must be in format: a@a.com", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert,animated: true)
                }
            }
                else{
                    let alert = UIAlertController(title: "Error", message: "Name must be: lowercase", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert,animated: true)
            }
        }
            else{
                let alert = UIAlertController(title: "Error", message: "Student Id should Contain C", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert,animated: true)
    }
    }
    
    
    @objc func movetoLogin(){
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.courseName.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return courseName[row]
    }
  

}
