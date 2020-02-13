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
    @IBOutlet weak var rexultCal: UITextView!
    @IBOutlet weak var rexultCal2: UITextView!
  
    var nowhtml:String!
    @IBOutlet weak var webview: WKWebView!

    @IBOutlet weak var resultCal: UITextView!
    @IBOutlet weak var resultCal2: UITextView!
    var getu:String = ""
    var ka:String = ""
    var sui:String = ""
    var moku:String = ""
    var kin:String = ""

    
    
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
    
    
    @IBAction func 時間割取得(_ sender: Any) {

        webview.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                   completionHandler: { (html: Any?, error: Error?) in
                                    self.nowhtml = html as? String
                                    if let doc = try? HTML(html: self.nowhtml, encoding: .utf8){
                   var sizes = [String]()
                    print(doc)
                    for link in doc.xpath("//td[@class='']") {
                        sizes.append(link.text!.replacingOccurrences(of: "\n", with: ""))
                        
                    }
                 var i = 0
                var dayt = 0
                 while( i<sizes.count){
                    print(sizes[i])
                    if(dayt != 6){
                    if let days = Int(sizes[i].replacingOccurrences(of: "\t", with: "")){
                        if(dayt == 0 && sizes[i+1] == "月"){
                        dayt = dayt+1
                        }else if(dayt != 0){
                         dayt = dayt+1
                        }
                    }
                    else{
                        if(dayt == 1){
                            self.getu = self.getu + sizes[i].replacingOccurrences(of: "\t", with: "") + "\n"
                            }else if(dayt == 2){
                            self.ka = self.ka + sizes[i].replacingOccurrences(of: "\t", with: "") + "\n"
                            }else if(dayt == 3){
                                self.sui = self.sui + sizes[i].replacingOccurrences(of: "\t", with: "") + "\n"
                            }else if(dayt == 4){
                                self.moku = self.moku + sizes[i].replacingOccurrences(of: "\t", with: "") + "\n"
                            }else if(dayt == 5){
                                self.kin = self.kin + sizes[i].replacingOccurrences(of: "\t", with: "") + "\n"
                            }

                    }
                    i=i+1
                    }else{
                        break
                    }
        
                 
                    

                    
                                        }
                                        Common.setUserDefaults(value: self.getu, key: "getu")
                                        Common.setUserDefaults(value: self.ka, key: "ka")
                                        Common.setUserDefaults(value: self.sui, key: "sui")
                                        Common.setUserDefaults(value: self.moku, key: "moku")
                                        Common.setUserDefaults(value: self.kin, key: "kin")
                                        
                                        
}
        
}
)
}
    
    @IBAction func 単位取得(_ sender: Any) {
        
        webview.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                   completionHandler: { (html: Any?, error: Error?) in
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
                    var senmonkamoku:Int
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
senmonkamoku=kiso3+senmon4
Common.setUserDefaults(value:ippan1, key: "aaa")
Common.setUserDefaults(value:joron2, key: "bbb")
Common.setUserDefaults(value:senmonkamoku, key: "ccc")
Common.setUserDefaults(value:senmon4, key: "ddd")
Common.setUserDefaults(value:pbl, key: "eee")
                                        
                            
                                        
        }
        }
                                    )
    }
    
}


                                    

