//
//  ViewController.swift
//  Auth
//
//  Created by khabbab on 18/11/18.
//  Copyright © 2018 khabbab. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController , NSURLConnectionDelegate {

    @IBOutlet weak var numberTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func login(_ sender: Any) {
        
        numberTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
        
        let loginRequest = [
            "phone_no" : self.numberTxt.text! as String,
            "password" : self.passwordTxt.text! as String
        ]
        //Custom header
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
             "x-access-token": "myToken"
        ]
        let credential = URLCredential(user: "phone_no", password: "password", persistence: .forSession)
        Alamofire.request("https://xyzyorsite/user/login", method: .post, parameters: loginRequest, encoding: URLEncoding.httpBody, headers: headers)
            .authenticate(usingCredential: credential)
            .responseJSON { (response:DataResponse<Any>) in
                print("data: \(response)")
                }
        }
}

