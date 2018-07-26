//
//  EquipmentInfoViewController.swift
//  Atlantica
//
//  Created by vimal devarajan on 17/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit

class DispatchInfoViewController: UIViewController {

    @IBOutlet weak var boxView: UIView!
    
    @IBOutlet weak var backDispatch: UIButton!
    @IBAction func nextDispatch(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "WorkPerformance", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "WorkPerformedViewController") as! WorkPerformedViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func backDispatch(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "EquipmentInfoViewController", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "EquipmentInfoViewController") as! EquipmentInfoViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backDispatch.backgroundColor = UIColor.init(red: 254.0, green: 117.0, blue: 23, alpha: 1.0)
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

}
