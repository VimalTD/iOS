//
//  SparePartsViewController.swift
//  Atlantica
//
//  Created by vimal devarajan on 20/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit

class SparePartsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
   
    @IBOutlet weak var boxView: UIView!
    
    @IBAction func addSpare(_ sender: Any) {
        self.noOfCells = noOfCells + 1
        self.spareTable.reloadData()
    }
    
    
   
    var noOfCells = 1
    @IBOutlet weak var spareTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.boxView.backgroundColor = UIColor.white
        self.boxView.layer.cornerRadius = 5.0
        self.boxView.layer.borderWidth = 0.2
        self.boxView.layer.shadowColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 0.9, 0.9, 1.0])
        self.boxView.layer.shadowOpacity = 1.0
        self.boxView.layer.shadowOffset = CGSize.init(width: 5.0, height: 5.0)
        // Do any additional setup after loading the view.
    }
   
    @IBAction func backSpare(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "WorkPerformance", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "WorkPerformedViewController") as! WorkPerformedViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func nextSpare(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Invoice", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "InvoiceViewController") as! InvoiceViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.spareTable.dequeueReusableCell(withIdentifier: "EquipmentCellTableViewCell") as! EquipmentCellTableViewCell
        return cell
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
