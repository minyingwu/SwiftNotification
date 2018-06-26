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
        NotificationCenter.default.addObserver(self, selector: #selector(receiveBanner100(notification:)), name: Notification.Name("ReceiveBanner100"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func receiveBanner100(notification: NSNotification) {
        if let userinfo = notification.userInfo {
            let alert = UIAlertController(title: userinfo["title"] as? String, message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func showNotification(_ sender: Any) {
        let testData = [DefaultKey.notificationId: Int32(100),
                    DefaultKey.category: "Notification_Test_Category",
                    DefaultKey.title: "testTitle",
                    DefaultKey.content: "testContent",
                    DefaultKey.timestamp: Double(999)] as [String : Any]
        MyAppNotificationHelper.shared.buildNotification(data: testData)
    }
}

