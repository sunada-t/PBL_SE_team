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
        let ud = UserDefaults.standard
           super.viewDidLoad()
        
        print(ud.array(forKey: "gett"))
       }
    @IBAction func syutoo(_ sender: UIButton) {
         print(printData)
        
    }
}
