//
//  TestObserver.swift
//  Hello World
//
//  Created by Mahmud Riad on 2/19/18.
//  Copyright © 2018 Mahmud Hasan Riad. All rights reserved.
//

import Foundation

import XCTest

class TestObserver: NSObject, XCTestObservation {
    var testsFailed = 0
    
    func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int) {
        print("test case failed or not passed or not" + description)
        
        var tmpMsgArr = description.components(separatedBy: ".---")
        let testcaseID = tmpMsgArr[1]
        
        print("------" + testcaseID)
        
        let fileManager = FileManager.default
        if let tDocumentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath =  tDocumentDirectory.appendingPathComponent("container")
            var date = Date()
            do {
                let attr = try FileManager.default.attributesOfItem(atPath: filePath.path)
                date = attr[FileAttributeKey.modificationDate] as! Date
                //var tmpMsgArr = date.components(separatedBy: " ")
                print(date)
            } catch {
                print("catch caught")
            }
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            //date = formatter.string(from: date)
            //print(date)
            
            let currentDate = Date()
            let calendar = Calendar.current
            let currentDay = calendar.dateComponents([.year, .month, .day], from: currentDate).day as! Int
            let createdDay = calendar.dateComponents([.year, .month, .day], from: date).day as! Int
            if(currentDay > createdDay){
                print("Remove folder code here")
            }
            
            if !fileManager.fileExists(atPath: filePath.path) {
                do {
                    try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    NSLog("Couldn't create document directory")
                }
            }
            NSLog("Document directory is \(filePath)")
        }
        
        let sss =  XCUIScreen.main.screenshot()
        var image = UIImage(named:"MYImageName")
        image = sss.image
        let s = XCTAttachment.init(screenshot: sss)
        s.lifetime = .keepAlways
        if let data = UIImagePNGRepresentation(image!) {
            let filename = getDocumentsDirectory().appendingPathComponent("/container/\(testcaseID).png")
            //let filename = URL(string: pathStr + "123456.png")
            try? data.write(to: filename)
        }
        testsFailed += 1
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
