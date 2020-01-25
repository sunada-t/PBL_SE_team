//
//  zikanwari.swift
//  apitest
//
//  Created by tsubasa-s on 2020/01/24.
//  Copyright © 2020 hiromu-m. All rights reserved.
//

import UIKit
import WebKit

class zikanwari: UIViewController,WKNavigationDelegate {
   
    @IBOutlet weak var webviewmkit: WKWebView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        if let url = URL(string: "https://subjregist.naist.jp"){
        self.webviewmkit.load(URLRequest(url: url))
          // Do any additional setup after loading the view.
          print("-----------")
          print(self.webviewmkit.url!)
          print("-----------")
        
            
            
          }
        
        
        
        // Do any additional setup after loading the view.
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
