//
//  ViewController.swift
//  Chat
//
//  Copyright © 2016 sfhacks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IB Outlet for message text box

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ChatHelper.connectToServer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IB Action for send button
    

}

