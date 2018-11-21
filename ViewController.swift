//
//  ViewController.swift
//  Auth
//
//  Created by khabbab on 18/11/18.
//  Copyright © 2018 khabbab. All rights reserved.
//

import UIKit
import Auth0
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
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
             "x-access-token": "myToken"
        ]
        let credential = URLCredential(user: "phone_no", password: "password", persistence: .forSession)
        Alamofire.request("https://fiveorzero.ml/api/v1/user/login", method: .post, parameters: loginRequest, encoding: URLEncoding.httpBody, headers: headers)
            .authenticate(usingCredential: credential)
            .responseJSON { (response:DataResponse<Any>) in
                print("data: \(response)")
                }
        }
        

//        Alamofire.request("https://fiveorzero.ml/api/v1/user/login", method: .post, parameters: loginRequest, encoding: URLEncoding.httpBody, headers: headers).responseJSON { (response:DataResponse<Any>) in
//            print("data: \(response)")
//            //let json = JSON(data.result)
//        }
        
    
//        NSLog("login ok")
//        let _login = numberTxt.text
//        let _password = passwordTxt.text
//
//        if((_login?.isEmpty)! || (_password?.isEmpty)!){
//            print("Empty \n Empty")
//        } else{
//            let request = NSMutableURLRequest(url: URL(string: "https://fiveorzero.ml/api/v1/user/login")! as URL)
//            request.httpMethod = "POST"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            let params = ["login": _login, "pass": _password]
//            do {
//             guard  let data = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted) else { return }
//                request.httpBody = data
//            } catch let error as NSError {
//                print("json error: \(error.localizedDescription)")
//            }
//
//            let loginTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
//                guard let data = data, let _ = response, error == nil else {
//                    print("error")
//                    return
//                }
//
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                    print(json)
//                } catch let error as NSError {
//                    print("json error: \(error.localizedDescription)")
//                }
//            })
//            loginTask.resume()
//        }
//    }
        
//
//         guard let url = URL(string: "https://fiveorzero.ml/api/user/login") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        var connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
//        print("user")
//
//    }
//
//    func connection(connection:NSURLConnection!, willSendRequestForAuthenticationChallenge challenge:URLAuthenticationChallenge!) {
//
//        if challenge.previousFailureCount > 1 {
//
//        } else {
//            let creds = URLCredential(user: numberTxt.text!, password: passwordTxt.text!, persistence: URLCredential.Persistence.none)
//            challenge.sender?.use(creds, for: challenge)
//
//        }
//
//    }
//
//    func connection(connection:NSURLConnection!, didReceiveResponse response: URLResponse) {
//        let status = (response as! HTTPURLResponse).statusCode
//        print("status code is \(status)")
//        // 200? Yeah authentication was successful
//    }
        
        
//        var request = URLRequest(url: URL(string: "https://fiveorzero.ml/api/user/login")!)
//        request.httpMethod = "POST"
//        let postString = "username=\(numberTxt.text!)&password=\(passwordTxt.text!)"
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                print("error=\(String(describing: error))")
//                return
//            }
//
//            let httpStatus = response as? HTTPURLResponse
//            print("statusCode should be 200, but is \(httpStatus!.statusCode)")
//            print("response = \(String(describing: response))")
//            print(postString)
//
//            let responseString = String(data: data, encoding: .utf8)
//            print("responseString = \(String(describing: responseString))")
//
//        }
//        task.resume() }

}

