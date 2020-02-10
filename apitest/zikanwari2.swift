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
        let a = Common.getUserDefaults(key: "getu")
        let b = Common.getUserDefaults(key: "ka")
        let c = Common.getUserDefaults(key: "sui")
        let d = Common.getUserDefaults(key: "moku")
        let e = Common.getUserDefaults(key: "kin")
          print(a)
          print(b)
          print(c)
          print(d)
          print(e)
    }
}
