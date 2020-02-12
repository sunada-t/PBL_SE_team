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
    
    @IBOutlet weak var tuesday: UITextView!
    
    @IBOutlet weak var wednesday: UITextView!
    
    @IBOutlet weak var thursday: UITextView!
    
    
    @IBOutlet weak var friday: UITextView!
    
    var nowhtml:String!
    @IBOutlet weak var webview: WKWebView!

    @IBOutlet weak var resultCal: UITextView!
    @IBOutlet weak var resultCal2: UITextView!
    

    
    
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
                self.rexultCal2.text = self.rexultCal2.text + sizes[i].replacingOccurrences(of: "\t", with: "") + "\n"
                            }else if(dayt == 2){
                                self.tuesday.text = self.tuesday.text + sizes[i].replacingOccurrences(of: "\t", with: "") + "\n"
                            }else if(dayt == 3){
                                self.wednesday.text = self.wednesday.text + sizes[i].replacingOccurrences(of: "\t", with: "") + "\n"
                            }else if(dayt == 4){
                                self.thursday.text = self.thursday.text + sizes[i].replacingOccurrences(of: "\t", with: "") + "\n"
                            }else if(dayt == 5){
                                self.friday.text = self.friday.text + sizes[i].replacingOccurrences(of: "\t", with: "") + "\n"
                            }

                    }
                    // self.rexultCal2.text = sizes[i].trimmingCharacters(in: .whitespacesAndNewlines)
                    i=i+1
                        
                    }else{
                        break
                    }
        
                 
                    

                    
                                        }
                        Common.setUserDefaults(value: self.rexultCal2.text, key: "getu")
                                        Common.setUserDefaults(value: self.tuesday.text, key: "ka")
                                        Common.setUserDefaults(value: self.wednesday.text, key: "sui")
                                        Common.setUserDefaults(value: self.thursday.text, key: "moku")
                                        Common.setUserDefaults(value: self.friday.text, key: "kin")
                                        
                                        
}
        
}
)
}
    
    @IBAction func 単位取得(_ sender: Any) {
        
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
                                    

