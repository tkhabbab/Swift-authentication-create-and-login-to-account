//
//  SignUpViewController.swift
//  Auth
//
//  Created by khabbab on 18/11/18.
//  Copyright © 2018 khabbab. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var n: UITextField!
    @IBOutlet weak var p: UITextField!
    @IBOutlet weak var ph: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var g: UITextField!
    var Parameters = [String: AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func goToLoginVC(_ sender: Any) {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! ViewController
        self.navigationController?.pushViewController(homeView, animated: true)
    }
    @IBAction func getData(_ sender: Any) {
        
        guard let url = URL(string: "https://fiveorzero.ml/api/v1/user/profile/") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
                
            }
            }.resume()
    }
    
    @IBAction func signup(_ sender: Any) {
        
        
        //let parameters: parameters  = ["name": "Tusher", "phoneNo": "012563", "password": "2gdsgh45", "birthday": "2018-12-23","gender": "1"]
        
        let parameters = ["name": n.text!, "phoneNo": p.text!, "password": ph.text!, "birthday": dob.text!,"gender": g.text!]
        
        guard let url = URL(string: "https://fiveorzero.ml/api/v1/user/new") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            
            }.resume()
        
    }
    

}
