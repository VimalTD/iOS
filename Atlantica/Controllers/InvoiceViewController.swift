//
//  InvoiceViewController.swift
//  Atlantica
//
//  Created by vimal devarajan on 20/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit

class InvoiceViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var boxView: UIView!
    
    @IBOutlet weak var tableViewInvoice: UITableView!
    let noOfCells = 8
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewInvoice.dequeueReusableCell(withIdentifier: "tableViewInvoice") as! InvoiceCell
        
        
        switch indexPath.row {
        case 1:
            cell.invoiceCEllTextTitle.text = "Trip Charge"
              cell.invoiceCellTextField.text = "0.0"
            cell.invoiceCellTextField.keyboardType = UIKeyboardType.decimalPad
        case 2:
            cell.invoiceCEllTextTitle.text = "Fuel Charge"
            cell.invoiceCellTextField.text = "0.0"
            cell.invoiceCellTextField.keyboardType = UIKeyboardType.decimalPad
        case 3:
            cell.invoiceCEllTextTitle.text = "Labour"
            cell.invoiceCellTextField.text = "0.0"
            cell.invoiceCellTextField.keyboardType = UIKeyboardType.decimalPad
        case 4:
            cell.invoiceCEllTextTitle.text = "Parts Used"
            cell.invoiceCellTextField.text = "0.0"
            cell.invoiceCellTextField.keyboardType = UIKeyboardType.decimalPad
        case 5:
            cell.invoiceCEllTextTitle.text = "Sub Total"
            cell.invoiceCellTextField.text = "0.0"
            cell.invoiceCellTextField.keyboardType = UIKeyboardType.decimalPad
        case 6:
            cell.invoiceCEllTextTitle.text = "Tax"
            cell.invoiceCellTextField.text = "0.0"
            cell.invoiceCellTextField.keyboardType = UIKeyboardType.decimalPad
        case 7:
            cell.invoiceCEllTextTitle.text = "Shipping"
            cell.invoiceCellTextField.text = "0.0"
            cell.invoiceCellTextField.keyboardType = UIKeyboardType.decimalPad
        case 8:
            cell.invoiceCEllTextTitle.text = "Total"
            cell.invoiceCellTextField.text = "0.0"
            cell.invoiceCellTextField.keyboardType = UIKeyboardType.decimalPad
        case 9:
            cell.invoiceCEllTextTitle.text = "Invoice"
            cell.invoiceCellTextField.placeholder = "Invoice"
            cell.invoiceCellTextField.keyboardType = UIKeyboardType.alphabet
        default: break
            
        }
        
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
    @IBAction func backInvoice(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "SpareParts", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "SparePartsViewController") as! SparePartsViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func nextInvoice(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Payment", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
