//
//  ViewController.swift
//  kabudev
//
//  Created by oonaka on 2018/05/24.
//  Copyright © 2018年 kabudev.123. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let ref = Database.database().reference()
        
        let conditionRef = ref.child("condition")
        conditionRef.observe(.value) { (snap) in
            
            let key = snap.key
            let value = snap.value!
            print("変更：key = \(key) value = \(value)")
        }
        
        let userIdRef = ref.child("user")
        userIdRef.observe(.childAdded) { (snap) in
            let key = snap.key
            let value = snap.value!
            print("user追加：key = \(key) value = \(value)")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

