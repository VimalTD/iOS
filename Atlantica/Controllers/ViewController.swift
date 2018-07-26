//
//  ViewController.swift
//  Atlantica
//
//  Created by vimal devarajan on 09/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit

import SkyFloatingLabelTextField



class ViewController: UIViewController {
   
     var postDictionary = NSMutableDictionary()
    let atlanticaUrls = AtlanticaUrls()
    let network = NetworkHelper.getInstance()
    @IBOutlet weak var nameText: SkyFloatingLabelTextField!
    @IBOutlet weak var emailText: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNumber: SkyFloatingLabelTextField!
    @IBOutlet weak var employeeCode: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.nameText.becomeFirstResponder
        self.nameText.title="Name"
        self.nameText.placeholder="Name"
        self.phoneNumber.title="Phone Number"
        self.emailText.title="Email"
        self.employeeCode.title="Employee code"
        
    }
    
 
    @IBAction func registerAction(_ sender: Any) {
        setEditingTextFields(check: true)
        let validation = self.ValidateFields()
        print(validation)
        self.RegisterUserApiCall()
    }
    
    
    
    
    @IBAction func loginAction(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "LoginPage", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func CompleteRegistration(data:Data?) -> Void {
        print("COmplete",data ?? "Comple")
    }
    
    func setEditingTextFields(check:Bool) -> Void {
        self.nameText.endEditing(check)
        self.emailText.endEditing(check)
        self.phoneNumber.endEditing(check)
        self.employeeCode.endEditing(check)
        if(!check){
            self.nameText.title="Name"
            self.nameText.placeholder="Name"
            self.phoneNumber.title="Phone Number"
            self.emailText.title="Email"
            self.employeeCode.title="Employee code"
        }
    }
    
    func RegisterUserApiCall() -> Void {
        postDictionary.setValue(0, forKey: "Id")
        postDictionary.setValue(false, forKey: "userIsExist")
        postDictionary.setValue(self.employeeCode.text, forKey: "userCode")
        postDictionary.setValue(self.nameText.text, forKey: "userName")
        postDictionary.setValue("userToken", forKey: "userToken")
        postDictionary.setValue(self.phoneNumber.text, forKey: "userPhone")
        postDictionary.setValue("userApproved", forKey: "userApproved")
        postDictionary.setValue("userActive", forKey: "userActive")
        postDictionary.setValue("dtTime", forKey: "dtTime")
        postDictionary.setValue(self.emailText.text, forKey: "userEmail")
    
        let jsonData = try! JSONSerialization.data(withJSONObject: postDictionary, options: [])
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
        
        print("JSON DATA",jsonString)
        let link=atlanticaUrls.userRegistration
        
        network.postJSONValues(url: link, postdata: jsonData, callBack:{ (data,error)->(Void) in
            if error == nil {
                if data != nil
                {
                    
                    print("DATA:::",data ?? "data")
                    self.CompleteRegistration(data: data)

                }
            }else{
                print("Error::",error ?? "error")
            }
        })
       
      
    }
    
    func ValidateFields() -> Bool {
        
        var isValid :Bool
        var selector :Int8
        isValid=false
        selector=0
        
        if(self.isValidEmail(email: self.emailText.text)){
            isValid = true
        }else{
            isValid = false
            selector = 1
            emailText.errorMessage = "Invalid email"
            emailText.errorColor = UIColor.red
        }
        
        if(self.isValidNumber(number: self.phoneNumber.text)){
            isValid = true
        }else{
            isValid = false
            if(selector == 0){
                selector = 2
            }
            phoneNumber.errorMessage="Invalid Number"
            phoneNumber.errorColor = UIColor.red
        }
        
        if (self.nameText.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)! {
            isValid = false
            nameText.errorMessage="Invalid Name"
            nameText.errorColor = UIColor.red
            if(selector == 0){
                selector = 3
            }
        }else{
            isValid = true
        }
        
        if(self.employeeCode.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)! {
            isValid = false;
            employeeCode.errorMessage="Invalid Employee Code"
            employeeCode.errorColor = UIColor.red
            if(selector == 0){
                selector = 4
            }
        }else{
            isValid = true
        }
        switch selector {
        case 1:
            self.nameText.errorMessage = nil
            self.nameText.selectedTitle = "Name"
           self.nameText.errorMessage = " "
            self.nameText.becomeFirstResponder
            let  newPosition = nameText.endOfDocument
            nameText.selectedTextRange = nameText.textRange(from: newPosition, to: newPosition)
        default: break
           
        }
        return isValid;
    }

    
    func isValidEmail(email:String?) -> Bool {
        if(email != nil){
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: email)
        }else{
            return false
        }
    }
    
    func isValidNumber(number:String?) -> Bool {
        if(number != nil){
            let phoneRegex = "^((\\+)|(00))[0-9]{6,14}$"
            let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: number)
        }else{
            return false
        }
    }
}

