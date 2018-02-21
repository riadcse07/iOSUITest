//
//  SecondViewController.swift
//  Hello World
//
//  Created by Mahmud Hasan  on 12/20/17.
//  Copyright © 2017 Mahmud Hasan Riad. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var userID : String = "No User"
    var password: String = "No Password"

    var myTimer = Timer()
    
    @IBOutlet weak var userLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(userID)
        print(password)
        
        // Timer
//        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        userLabel.text = userID
        
        createViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("Second View:  \(GlobalVariables.instance.number)")
    }
    
    func update() {
        print("Update...")
        
    }

    func createViews () {
        
        // View
        let topRightView = UIView(frame: CGRect(x: UIScreen.main.bounds.maxX - 16 - 100, y: 100, width: 100, height: 100))
        topRightView.backgroundColor = .blue
        view.addSubview(topRightView)
        
        // Image View
        let bottomRightImageView = UIImageView(frame: CGRect(x: UIScreen.main.bounds.maxX - 16 - 150, y: 250, width: 150, height: 250))
        bottomRightImageView.image = UIImage(named: "BG")
        bottomRightImageView.contentMode = .scaleAspectFit
        view.addSubview(bottomRightImageView)
    
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        myTimer.invalidate()
    }

}
