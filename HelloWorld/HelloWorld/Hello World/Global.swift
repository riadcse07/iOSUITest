//
//  Global.swift
//  Hello World
//
//  Created by Mahmud Hasan  on 12/20/17.
//  Copyright © 2017 Mahmud Hasan Riad. All rights reserved.
//

import Foundation

class GlobalVariables: NSObject {
    
    // Instance of Class
    static let instance = GlobalVariables()
    
    // Variables
    var number : Int = 10
    
    // Constructor
    override init() {
        
        number = 20
        
    }
    
    
}
