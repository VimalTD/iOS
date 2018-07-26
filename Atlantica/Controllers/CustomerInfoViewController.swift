//
//  CustomerInfoViewController.swift
//  Atlantica
//
//  Created by vimal devarajan on 16/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit

class CustomerInfoViewController: UIViewController {
var datePicker : UIDatePicker!
    var toolBar = UIToolbar()
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var selectDateCust: UIButton!
   
    @IBOutlet weak var nextCust: UIButton!
    @IBOutlet weak var nextTemp: UIButton!
  
    @IBOutlet weak var eMail: UITextField!
    @IBOutlet weak var address: UITextField!
  
    @IBAction func logoutAction(_ sender: Any) {
        
        
    }
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.boxView.backgroundColor = UIColor.white
        self.boxView.layer.cornerRadius = 5.0
        self.boxView.layer.borderWidth = 0.2
        self.boxView.layer.shadowColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 0.9, 0.9, 1.0])
        self.boxView.layer.shadowOpacity = 1.0
        self.boxView.layer.shadowOffset = CGSize.init(width: 5.0, height: 5.0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
   
 
    
   
    
    @IBAction func nextCust(_ sender: Any) {
        if ValidateCustomerInfo(){
            var cModel = CustomerRequestModel()
            cModel.Id = 1
            cModel.CustName = self.firstName.text// + self.lastName.text
            cModel.CustEmail = self.eMail.text
            cModel.dtTime = self.ConvertToUTC(dateString: self.selectDateCust.titleLabel?.text)
            cModel.CustAddss = self.address.text
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            do {
                let jsonData = try encoder.encode(cModel)
                print("jsonData:::",String(data: jsonData, encoding: .utf8)!)
                
            }catch{
                
                print("Server error")
                
            }
            let storyBoard : UIStoryboard = UIStoryboard(name: "EquipmentInfo", bundle:nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier: "EquipmentInfoViewController") as! EquipmentInfoViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
    }
    
    func ConvertToUTC(dateString: String!) -> String {
        print("DAATE::",dateString)
     
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        
        let dd = dateFormatter.date(from: dateString!)
        print("DAATE:22:",dd ?? "dd")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:MM:SS"
        let newDate = dateFormatter.string(from: dd!) //pass Date here
        print(newDate)
        
        
        print("date:::::",newDate)
      return newDate
    }
    
    func ValidateCustomerInfo() -> Bool {
        
        var isValid :Bool
        isValid=false
        if(self.firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)! {
            isValid = false
            //            firstName.errorMessage="Invalid First Name"
            //            firstName.errorColor = UIColor.red
        }else{
            isValid = true
        }
        
        if(self.eMail.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)! {
            isValid = false
            //            eMail.errorMessage="Invalid Email"
            //            eMail.errorColor = UIColor.red
        }else{
            isValid = true
        }
        
        if(self.address.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)! {
            isValid = false;
            //            address.errorMessage="Invalid address"
            //            address.errorColor = UIColor.red
        }else{
            isValid = true
        }
        if(self.selectDateCust.titleLabel?.text == "Select Date") {
            isValid = false;
            
        }else{
            isValid = true
        }
        return isValid
    }
    
    @IBAction func selectDateCust(_ sender: Any) {
        doDatePicker()
    }
    
    func doDatePicker(){
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
      //  self.scrollViewCust.isUserInteractionEnabled = false
       // scrollViewCust.contentSize = CGSize(width: self.view.frame.size.width, height: 1)
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        self.datePicker.timeZone = TimeZone(secondsFromGMT: 0)
        self.datePicker?.backgroundColor = UIColor.white
        self.datePicker?.datePickerMode = UIDatePickerMode.date
        datePicker.center = view.center
        datePicker.minimumDate = Date()
        view.addSubview(self.datePicker)
        toolBar = UIToolbar(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.center = view.center
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        self.view.addSubview(toolBar)
        self.toolBar.isHidden = false
    }
    
    @objc func doneClick() {
        DispatchQueue.main.async {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.timeZone = TimeZone.current
         let dateString = dateFormatter.string(from: self.datePicker.date)
            print("sel date:::",dateString)
        self.selectDateCust.setTitle(dateString, for: .normal)
            
         
            self.toolBar.isHidden = true
            self.view.backgroundColor = UIColor.white.withAlphaComponent(1)
//            self.scrollViewCust.isUserInteractionEnabled = true
//            self.scrollViewCust.contentSize = CGSize(width: self.view.frame.size.width, height:self.view.frame.size.height + 150 )
             self.datePicker.isHidden = true
        }
    }
    
    //MARK: Cancel Date Picker
    @objc func cancelClick() {
        self.view.backgroundColor = UIColor.white.withAlphaComponent(1)
//        self.scrollViewCust.isUserInteractionEnabled = true
//        self.scrollViewCust.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height + 150)
        self.datePicker.isHidden = true
        self.toolBar.isHidden = true
    }
}
