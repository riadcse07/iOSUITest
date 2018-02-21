//
//  ViewController.swift
//  Hello World
//
//  Created by Mahmud Hasan  on 12/20/17.
//  Copyright © 2017 Mahmud Hasan Riad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let screenBound = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Main View Controller")
        print(screenBound)
        
        // Creating Login Anyway Button
        let logInAnyWayButton = UIButton(frame: CGRect(x: screenBound.midX-100, y: 250, width: 200, height: 40))
        logInAnyWayButton.backgroundColor = UIColor.gray
        logInAnyWayButton.setTitle("Log In Anyway", for: .normal)
        logInAnyWayButton.addTarget(self, action: #selector(logInAnyWay), for: .touchUpInside)
        view.addSubview(logInAnyWayButton)
        
        // Sucure password textfield
        passwordTextField.isSecureTextEntry = true
        
        // Setting Delegates
        passwordTextField.delegate = self
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print(GlobalVariables.instance.number)
    }
    
    @IBAction func logIn(_ sender: Any) {
        print("Log In Button Tapped")
        
    }
    
    @objc func logInAnyWay() {
        print("Log In Any Way Button Tapped")
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let svc = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        svc.userID = userTextField.text!
        svc.password = passwordTextField.text!
        
//        show(svc, sender: Any?.self)
        navigationController?.pushViewController(svc, animated: true)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToSecondView" {
            
            let svc = segue.destination as! SecondViewController
            svc.userID = userTextField.text!
            svc.password = passwordTextField.text!
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()

        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
}

