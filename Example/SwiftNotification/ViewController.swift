//
//  ViewController.swift
//  SwiftNotification
//
//  Created by minyingwu on 06/01/2018.
//  Copyright (c) 2018 minyingwu. All rights reserved.
//

import UIKit
import SwiftNotification

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showNotification(_ sender: Any) {
        let testData = [DefaultKey.NotificationId: 100,
                    DefaultKey.Category: "Notification_Test_Category",
                    DefaultKey.Title: "testTitle",
                    DefaultKey.Content: "testContent",
                    DefaultKey.TimeStamp: 999] as [String : Any]
        MyAppNotificationHelper.shared.buildNotification(data: testData)
    }
}

