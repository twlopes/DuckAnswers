//
//  ViewController.swift
//  DuckAnswers
//
//  Created by Tristan Lopes on 26/06/2014.
//  Copyright (c) 2014 twlopes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var api = Api()
        api.appName = "DuckAnswer"
        api.queryInstantAnswer("duck", result: {(answer: Answer?, success: Bool, error: NSError?) in
            println(success)
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

