//
//  NaistWebViewController.swift
//  apitest
//
//  Created by hiromu-m on 2020/01/21.
//  Copyright © 2020 hiromu-m. All rights reserved.
//fffsssssssssa

import UIKit
import WebKit
import Kanna

class NaistWebViewController: UIViewController,WKNavigationDelegate{

    @IBOutlet weak var rexultCal2: UITextView!
    var nowhtml:String!
    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var resultCal: UITextView!
    
    
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
                     var i = 0
                    var ippan1 = 0
                    var joron2 = 0
                    var kiso3 = 0
                    var senmon4 = 0
                    var pbl = 0
            while( i<sizes.count){

                let k = sizes[i].suffix(5)
                if k.prefix(1) == "1"{
                    ippan1 += 1
                }else if k.prefix(1) == "2"{
                    joron2 += 1
                }else if k.prefix(1) == "3"{
                    kiso3 += 1
                }else if k.prefix(1) == "4"{
                    senmon4 += 1
                }else if k.prefix(1) == "5"{
                    pbl += 1
                }
                //print("\(sizes[i].suffix(6))--\(sizes[i+1].prefix(5))--\(sizes[i+2].prefix(5))--\(sizes[i+3].prefix(5))")
                  i = i+4
                                        }
        print("単位取得情報ダオ")
        print(self.webview.url!)
        self.resultCal.text = "一般 ---->> \(ippan1)/4\n序論 ---->> \(joron2)/3 "
        self.rexultCal2.text = " 基礎と専門 ->> \(kiso3+senmon4)/12\n pbl ----->> \(pbl)/2"
                                        
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
