//
//  zikanwari1.swift
//  apitest
//
//  Created by tsubasa-s on 2020/01/24.
//  Copyright © 2020 hiromu-m. All rights reserved.
//

import UIKit
import WebKit
import Kanna

class zikanwari1:
      UIViewController
      ,WKNavigationDelegate{
    
    var resultCal2=""
    var tuesday=""
    
    var nowhtml:String!
    @IBOutlet weak var webvieww: WKWebView!
    
    override func viewDidLoad() {
    
    super.viewDidLoad()
    
        if let url = URL(string: "https://subjregist.naist.jp"){
        self.webvieww.load(URLRequest(url: url))
              // Do any additional setup after loading the view.
            print("-----------")
            print(self.webvieww.url!)
            print("-----------")

              }
            // Do any additional setup after loading the view.

}
    
    var sizes = [String]()

    @IBAction func aaaa(_ sender: UIButton) {
        webvieww.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                                       completionHandler: { (html: Any?, error: Error?) in
                                                        self.nowhtml = html as? String
                                                        if let doc = try? HTML(html: self.nowhtml, encoding: .utf8){
                                       var sizes = [String]()
                                                           
                                        for link in doc.xpath("//td[@class='']") {
                                            sizes.append(link.text!.replacingOccurrences(of: "\n", with: ""))
                                             
                                        }
                                    print(sizes)
print(type(of: sizes))
                                                        }
                    }
            )
        }
    @IBAction func next(_ sender: Any) {
           performSegue(withIdentifier: "goToNext", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToNext" {
                let nextVC = segue.destination as! zikanwari2
                nextVC.printData = sizes as! String
            }
        }
    }
