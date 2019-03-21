//
//  Validation.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-20.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

extension String{
    func verifyID()->Bool{
        if self.hasPrefix("c"){
            if self.count < 10{
                return true
            }
        }
        return false
    }
    func verifyEmail()->Bool{
        if self.contains("@"){
            if self.contains("."){
                return true
            }
        }
        return false
    }
}
