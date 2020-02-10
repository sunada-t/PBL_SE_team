//
//  zikanwari2.swift
//  
//
//  Created by tsubasa-s on 2020/02/09.
//

import UIKit
import WebKit
import Kanna


class zikanwari2: UIViewController {
       var printData : String = ""
    
       override func viewDidLoad() {
        
           super.viewDidLoad()
        
 
       }
    @IBAction func syutoo(_ sender: UIButton) {
         let str = Common.getUserDefaults(key: "hoge")
          print(str)
    }
}
