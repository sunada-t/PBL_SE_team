//
//  BusTimeViewController.swift
//  apitest
//
//  Created by hiromu-m on 2020/01/22.
//  Copyright © 2020 hiromu-m. All rights reserved.
//

import UIKit
import WebKit
class BusTimeViewController: UIViewController,WKUIDelegate{

    
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://arosh.github.io/naist-bus-schedule/"
               let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
               
               let url = NSURL(string: encodedUrlString!)
               let request = NSURLRequest(url: url! as URL)
        
               webview.load(request as URLRequest)
               
               self.view.addSubview(webview)
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
