//
//  NaistWebViewController.swift
//  apitest
//
//  Created by hiromu-m on 2020/01/21.
//  Copyright © 2020 hiromu-m. All rights reserved.
//fff

import UIKit
import WebKit
import Alamofire
import Kanna

class NaistWebViewController: UIViewController,WKNavigationDelegate{

    
    @IBOutlet weak var webview: WKWebView!
    
    let params: Parameters = [
        "Username": "ryulstory",
        "Password": "1234!"
    ]

    let loginRequest = [
            "data[User][account]": "aaaaaaa",
            "data[User][password]": "UserPassword"
        ]
    let headers = ["Content-Type" : "text/html"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        if let url = URL(string: "https://subjregist.naist.jp"){
        self.webview.load(URLRequest(url: url))
          // Do any additional setup after loading the view.
          print("-----------")
          print(self.webview.url!)
          print("-----------")
            
            Alamofire.request(url, method : .post, parameters : loginRequest, encoding :
            JSONEncoding.default , headers : headers).responseData { dataResponse in

            print("[[[[[[[[[[[[[[[[[[[[")
             print(dataResponse.request as Any) // your request
             //print(dataResponser.response as Any) // your response
                print("]]]]]]]]]]]]]]]")
             }
            
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
