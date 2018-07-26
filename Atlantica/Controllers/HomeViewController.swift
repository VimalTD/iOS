//
//  HomeViewController.swift
//  Atlantica
//
//  Created by vimal devarajan on 11/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit
import Toast_Swift
import SkyFloatingLabelTextField
import SafariServices



let atlanticaUrls = AtlanticaUrls()
let utility = Utility()

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var workHistoryTableView: UITableView!
        @IBOutlet weak var resendEmail: UIButton!
    var userToken: String!
    var history = [History]()
    let network = NetworkHelper.getInstance()
    let cellReuseIdentifier = "workHistoryCell"
    var limitStart:Int8!
     var limitEnd:Int8!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        limitStart = 0
        limitEnd = 10
        userToken = UserDefaults.standard.string(forKey: "userToken")!
         self.navigationController?.isNavigationBarHidden = true
        self.getWorkHistory()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.history.count > 0 {
            return self.history.count
        } else {
            return 0
        }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.workHistoryTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! WorkHistoryCell
        if(history.count>indexPath.row){
            print("NAME::",self.history[indexPath.row].customerName ?? "C NAME")
            if(self.history[indexPath.row].customerName != nil ){
               cell.workHistoryTitle.text = self.history[indexPath.row].customerName
            }
            if(self.history[indexPath.row].workDone != nil ){
                   cell.workHistoryDesc.text  = self.history[indexPath.row].workDone
            }
            if(self.history[indexPath.row].Date != nil ){
            cell.workHistoryDate.text  = self.history[indexPath.row].Date
            }
            if indexPath.row == self.history.count - 1 {
                limitStart = limitEnd
                limitEnd = limitEnd + 10
                DispatchQueue.main.async {
                     self.getWorkHistory()
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ticketId = String(self.history[indexPath.row].id)
        let url = atlanticaUrls.getTicketUrl + userToken + "&TicketID=" + ticketId
        print("selected url",url)
        let settingsUrl = NSURL(string:url)! as URL
        let svc = SFSafariViewController(url: settingsUrl)
        present(svc, animated: true, completion: nil)
    }
    
    @IBAction func addButton(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "CustomerInfo", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CustomerInfoViewController") as! CustomerInfoViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func resendEmail(_ sender: Any) {
        let link = atlanticaUrls.resendMail
        print (link)
        
        self.network.getValues(url: link) { (data, error) -> (Void) in
            if error == nil {
                if data != nil
                {
                       self.view.makeToast("Email send successfully")
                }else{
                    print("DATA  NILL")
                }
            }
        }
    }
    
    
    @IBAction func logoutAction(_ sender: Any) {
        let userToken = UserDefaults.standard.string(forKey: "userToken")
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.set(userToken, forKey: "userToken")
        UserDefaults.standard.synchronize()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
 
    func getWorkHistory() -> Void {
            let link1 = atlanticaUrls.workHistoryUrl + userToken
        let link2 = link1 + "&limitStart="+String(limitStart)
        let link = link2 + "&limitEnd="+String(limitEnd)
        print (link)
        
        self.network.getValues(url: link) { (data, error) -> (Void) in
            if error == nil {
                if data != nil
                {
                    print("DATA NOT NILL")
                    self.Completion(responseData: data)
                }else{
                     print("DATA  NILL")
                }
            }
        }
        
    }
    func Completion(responseData:Data?) -> Void {
        do {
            let tempHistory = try JSONDecoder().decode([History].self, from: responseData!)
            
            for i in 0..<tempHistory.count {
                    self.history.append(tempHistory[i])
                }
                DispatchQueue.main.async {
                     self.workHistoryTableView.reloadData()
                }
                
            
            print(history)
        }catch{
            DispatchQueue.main.async {
                self.view.makeToast("Server error")
            }
        }
    }
}
