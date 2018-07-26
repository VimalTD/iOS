//
//  PaymentViewController.swift
//  Atlantica
//
//  Created by vimal devarajan on 20/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController,YPSignatureDelegate {

    @IBOutlet weak var signature: YPDrawSignatureView!
    
    @IBOutlet weak var boxView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.boxView.backgroundColor = UIColor.white
         self.boxView.layer.cornerRadius = 5.0
         self.boxView.layer.borderWidth = 0.2
        self.boxView.layer.shadowColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 0.9, 0.9, 1.0])
         self.boxView.layer.shadowOpacity = 1.0
        self.boxView.layer.shadowOffset = CGSize.init(width: 5.0, height: 5.0)
        signature.delegate = self
        self.signature.layer.borderWidth = 1
        self.signature.layer.borderColor = UIColor.black.cgColor
    }
    

    @IBAction func backPayment(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Invoice", bundle:nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "InvoiceViewController") as! InvoiceViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func preview(_ sender: Any) {
        
        let image : UIImage = self.signature.getSignature()!
        let imageData:NSData = UIImagePNGRepresentation(image)! as NSData
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        print("Base64",strBase64)
        
    }
    @IBAction func clearSign(_ sender: Any) {
         self.signature.clear()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func didStart(_ view : YPDrawSignatureView) {
        print("Started Drawing")
    }
    
    // didFinish() is called rigth after the last touch of a gesture is registered in the view.
    // Can be used to enabe scrolling in a scroll view if it has previous been disabled.
    func didFinish(_ view : YPDrawSignatureView) {
        print("Finished Drawing")
    }
    
    

}
