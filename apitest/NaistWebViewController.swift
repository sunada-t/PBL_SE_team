//
//  NaistWebViewController.swift
//  apitest
//
//  Created by hiromu-m on 2020/01/21.
//  Copyright © 2020 hiromu-m. All rights reserved.
//fffsssssssssa

import UIKit
import WebKit
import Alamofire
import Kanna

class NaistWebViewController: UIViewController,WKNavigationDelegate{

    var nowhtml:String!
    @IBOutlet weak var webview: WKWebView!
    
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        if let url = URL(string: "https://subjregist.naist.jp"){
        self.webview.load(URLRequest(url: url))
          // Do any additional setup after loading the view.
          print("-----------")
          print(self.webview.url!)
          print("-----------")
        
            
            
          }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func htmlget(_ sender: Any) {
        webview.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                   completionHandler: { (html: Any?, error: Error?) in
                                    print(type(of:html))
                                    self.nowhtml = html as? String
                                    if let doc = try? HTML(html: self.nowhtml, encoding: .utf8){
                   var sizes = [String]()
                    for link in doc.xpath("//td[@class='bgGray01']") {
                        sizes.append(link.text ?? "")
                    }
                   print(sizes)
        }
        }
                                    )
        
       
            
        }
        
    

            // if let doc = try? HTML(html: html, encoding: .utf8) {
             // 牛丼のサイズをXpathで指定
           //  var sizes = [String]()
            // for link in doc.xpath("//th[@class='menu-size']") {
            //     sizes.append(link.text ?? "")
             //}
                //                    }
               
      //  })
      /*
            if let doc = try? HTML(html: html, encoding: .utf8) {
                // 牛丼のサイズをXpathで指定
                var sizes = [String]()
                for link in doc.xpath("//th[@class='menu-size']") {
                    sizes.append(link.text ?? "")
                }
                
                //牛丼の値段をXpathで指定
                var prices = [String]()
                for link in doc.xpath("//td[@class='menu-price']") {
                    prices.append(link.text ?? "")
                }

                //牛丼のサイズ分だけループ
                for (index, value) in sizes.enumerated() {
                    let gyudon = Gyudon()
                    gyudon.size = value
                    gyudon.price = prices[index]
                }
                //print("======================")
                //print(self.beefbowl)
                
               
            
        }*/
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
