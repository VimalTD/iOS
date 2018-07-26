//
//  LoginViewController.swift
//  Atlantica
//
//  Created by vimal devarajan on 10/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit
import Foundation
import Toast_Swift
import SkyFloatingLabelTextField
import MBProgressHUD


class LoginViewController: UIViewController {

    let network = NetworkHelper.getInstance()
   //Outlets
   
    @IBOutlet weak var loginTextField: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginTextField.title="Employee Code"
         self.navigationController?.isNavigationBarHidden = true
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func loginAction(_ sender: Any) {
        self.view.endEditing(true)
        
        if(Validate()){
            let atlanticaUrls = AtlanticaUrls()
            var empCode: String = ""
            empCode = loginTextField.text!
            let link=atlanticaUrls.loginUrl+empCode
            MBProgressHUD.showAdded(to: self.view, animated: true)
            network.getValues(url: link) { (data, error) -> (Void) in
                if error == nil {
                    if data != nil
                    {
                        self.Completion(data: data)
                    }
                }else{
                    DispatchQueue.main.async {
                        MBProgressHUD.hide(for: self.view, animated: true)
                        self.view.makeToast("Server error")
                    }
                }
            }
        }
    }
    
    @IBAction func reigisterAction(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
    @IBAction func loginTextEditStart(_ sender: Any) {
        if(loginTextField.text == "Invalid Name"){
            self.loginTextField.errorMessage=" "
            self.loginTextField.errorColor = UIColor.black
        }
       
        
    }
    
    func Completion(data:Data?) -> Void {
        do {
            let userDetails = try JSONDecoder().decode(UserDetails.self, from: data!)
            print(userDetails)
            if(userDetails.userActive == "1" && userDetails.userApproved == "1"){
                DispatchQueue.main.async {
                    let defaults = UserDefaults.standard
                    defaults.set(userDetails.userToken, forKey:"userToken")
                    defaults.set(true, forKey: "userLogin")
                    defaults.synchronize()
                    MBProgressHUD.hide(for: self.view, animated: true)
                    let storyBoard : UIStoryboard = UIStoryboard(name: "HomeStoryboard", bundle:nil)
                    let viewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }else {
                DispatchQueue.main.async {
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.view.makeToast("Invalid user")
                }
            }
        }
        catch {
           self.view.makeToast("Server error")
        }
        
    }
    
    func Validate() -> Bool {
        if (self.loginTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)! {
            self.loginTextField.errorMessage="Invalid Name"
            self.loginTextField.errorColor = UIColor.red
            return false
        }else{
           return true
        }
        
        
    }
}


