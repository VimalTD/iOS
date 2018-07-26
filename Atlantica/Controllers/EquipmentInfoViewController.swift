//
//  EquipmentInfoViewController.swift
//  Atlantica
//
//  Created by vimal devarajan on 19/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit

class EquipmentInfoViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
     var noOfCells = 2
   
    @IBOutlet weak var nextEquip: UIButton!
    @IBOutlet weak var backEquip: UIButton!
    @IBOutlet weak var equipentTableView: UITableView!
    
    @IBOutlet weak var boxView: UIView!
    @IBAction func backEquip(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "CustomerInfo", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CustomerInfoViewController") as! CustomerInfoViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noOfCells
    }
    @IBOutlet weak var addEquipment: UIButton!
    
    @IBAction func nextEquipAction(_ sender: Any) {
        
       
        let storyBoard : UIStoryboard = UIStoryboard(name: "DispatchInfo", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DispatchInfoViewController") as! DispatchInfoViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let hitpoint = textField.convert(CGPoint.zero, to: equipentTableView)
        let indexPath = self.equipentTableView.indexPathForRow(at: hitpoint)
//        if indexPath.row == 0 {
//            if textField.tag == 1 {
//
//            } else if textField {
//
//            }
        return true
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.equipentTableView.dequeueReusableCell(withIdentifier: "EquipmentCellTableViewCell") as! EquipmentCellTableViewCell
        return cell
    }
    

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addEquipment(_ sender: Any) {
        self.noOfCells = noOfCells + 1
        equipentTableView.reloadData()
    }
}
