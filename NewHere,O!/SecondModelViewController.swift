//
//  SecondModelViewController.swift
//  NewHere,O!
//
//  Created by GW_15 on 23/07/2020.
//  Copyright © 2020 GW_15. All rights reserved.
//

import UIKit

class SecondModelViewController: UIViewController {

        @IBOutlet weak var labelFill: UILabel!
        @IBOutlet weak var textFieldFill: UITextField!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }

        @IBAction func touch완료(_ sender: Any) {
            var msg = "With "
            msg = msg + textFieldFill.text! + "와(과) 여행을 시작하시겠습니까?"
            labelFill.text = msg
        }
        
    }
