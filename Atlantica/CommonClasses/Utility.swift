//
//  Utility.swift
//  Atlantica
//
//  Created by vimal devarajan on 14/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import Foundation

class Utility{
    
    func isValidEmail(email:String?) -> Bool {
        if(email != nil){
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
        }else{
            return false
        }
    }
}
