//
//  testViewController.swift
//  apitest
//
//  Created by hiromu-m on 2020/01/28.
//  Copyright © 2020 hiromu-m. All rights reserved.
//   

import UIKit
import WebKit
import Kanna

class testViewController: UIViewController,WKNavigationDelegate{

    @IBOutlet weak var rexultCal2: UITextView!
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
                                    self.nowhtml = html as? String
                                    if let doc = try? HTML(html: self.nowhtml, encoding: .utf8){
                   var sizes = [String]()
                                       
                    for link in doc.xpath("//td[@class='']") {
                        sizes.append(link.text!.replacingOccurrences(of: "\n", with: ""))
                        
                    }
                 var i = 0
                 while( i<sizes.count){
                    print(sizes[i])
                    
                    if let days = Int(sizes[i].replacingOccurrences(of: "\t", with: "")){
                        self.rexultCal2.text = self.rexultCal2.text +  "\n=======\(days)日目========\n"
                    }
                    else{
                  self.rexultCal2.text = self.rexultCal2.text + sizes[i].replacingOccurrences(of: "\t", with: "")
                    }
                    // self.rexultCal2.text = sizes[i].trimmingCharacters(in: .whitespacesAndNewlines)
                    i=i+1
                   
                         
                                        }
}
        
}
)
}
}

/*
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
                  i = i+4
                                        }
        print("単位取得情報ダオ")
        print(self.webview.url!)
        self.resultCal.text = "一般 ---->> \(ippan1)/4\n序論 ---->> \(joron2)/3 "
        self.rexultCal2.text = " 基礎と専門 ->> \(kiso3+senmon4)/12\n pbl ----->> \(pbl)/2"
                                        
        }
        }
                                    )
        
       
            
        }*/
                                    

