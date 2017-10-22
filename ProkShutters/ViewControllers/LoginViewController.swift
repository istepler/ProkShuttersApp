//
//  LoginViewController.swift
//  ProkShutters
//
//  Created by Andrey Krit on 10/15/17.
//  Copyright © 2017 Andrey Krit. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var freeEnterButton: UIButton!
    @IBOutlet weak var loginTextFieldTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var enterTextFieldBottomConstaraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
                setupLoginButton()
               // calculateConsraints()
    }
    
    private func setupLoginButton() {
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor(colorLiteralRed: 1, green: 191/255, blue: 0, alpha: 1).cgColor
        freeEnterButton.layer.borderWidth = 2
        freeEnterButton.layer.borderColor = UIColor(colorLiteralRed: 1, green: 191/255, blue: 0, alpha: 1).cgColor
        freeEnterButton.layer.cornerRadius = 15
        
    }
    
    func calculateConsraints() {
        enterTextFieldBottomConstaraint.constant = 70
        loginTextFieldTopConstraint.constant = view.frame.height - enterTextFieldBottomConstaraint.constant - 138
        view.updateConstraints()
        
       // loginTextFieldTopConstraint = view.frame.height
    }
    
    func sendRequest(url: String, parameters: [String: AnyObject], completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTask {
        let requestURL = URL(string: url + "?" + "Hello")!
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
        
        return task
    }

    
    @IBAction func senfreq(_ sender: Any) {
        sendRequest(url: "http://91.215.25.24:44450", parameters: ["1": "HelloWorld" as AnyObject]) { (data, response, error) in
            print(data)
            print(response)
            print("Error\(error)")
        }
    }
    @IBOutlet weak var send: UIButton!
    
    
    }
