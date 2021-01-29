//
//  ViewController.swift
//  payment
//
//  Created by Durgesh Ghuge on 29/01/21.
//  Copyright © 2021 Durgesh Ghuge. All rights reserved.
//

import UIKit
import Razorpay

class ViewController: UIViewController{
    
    

    var razorpay:RazorpayCheckout!
    
    @IBOutlet weak var paymentButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        razorpay = RazorpayCheckout.initWithKey("rzp_test_e9wC5jphTMW4u0", andDelegate: self)
    }

    

    @IBAction func didTapPayNow(_ sender: UIButton) {
        
        let options: [String:Any] = [
                   "id": "order_DBJOWzybf0sJbb",
                    "entity": "order",
                    "amount": 50000,
                    "amount_paid": 0,
                    "amount_due": 50000,
                    "currency": "INR",
                    "receipt": "rcptid_11",
                    "status": "created",
                    "attempts": 0,
                    "notes": [],
                    "created_at": 1566986570,
                    "theme": [
                        "color": "#F37254"
                    ]
                ]
        razorpay.open(options)
        
    }
}


extension ViewController: RazorpayPaymentCompletionProtocol{
    func onPaymentError(_ code: Int32, description str: String) {
        let alert = UIAlertController(title: "Not Paid", message: "\(code)\n\(str)", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        let alert = UIAlertController(title: "Paid", message: "Payment Successful", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)

    }
    
    
    
}

