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

    var nowhtml:String!
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var nabinabi: UITextView!
    var getu:String = ""
    var ka:String = ""
    var sui:String = ""
    var moku:String = ""
    var kin:String = ""
    var progressView = UIProgressView()
    var monthArray:[[String?]] = []
    var dayArray:[String?] = []
    @IBOutlet weak var tanibutton: UIButton!
    @IBOutlet weak var timelinebutton: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.webview.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil);
        if let url = URL(string: "https://subjregist.naist.jp"){
        self.webview.load(URLRequest(url: url))
          // Do any additional setup after loading the view.
          print("-----------")
          print(self.webview.url!)
          print("-----------")
        timelinebutton.isHidden = true
        tanibutton.isHidden = true

          }
        // Do any additional setup after loading the view.
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            progressView.setProgress(Float(webview.estimatedProgress), animated: true)
            print(webview.url)
            if(webview.url! == URL(string:"https://subjregist.naist.jp/registrations/preview_list")){
                nabinabi.text = "このページから今の単位がわかるよ"
                tanibutton.isHidden = false
                timelinebutton.isHidden = true
            }else if(webview.url! == URL(string:"https://subjregist.naist.jp/schedules/preview_monthly")){
                nabinabi.text = "このページからは月の時間割が取れるよ"
                timelinebutton.isHidden = false
                tanibutton.isHidden = true
            }else if(webview.url! == URL(string:"https://subjregist.naist.jp/")){
                nabinabi.text = "loginしてください"
            }else{
                timelinebutton.isHidden = true
                tanibutton.isHidden = true
            }
            
        }
    }
    
    @IBAction func getTimeline(_ sender: Any) {
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
                        
                         while( i<sizes.count){
                            print(sizes[i])
                            if let days = Int(sizes[i].replacingOccurrences(of: "\t", with: "")){
                                if(self.dayArray != []){
                                    self.monthArray.append(self.dayArray)
                                self.dayArray.removeAll()
                                }
                                self.dayArray.append(sizes[i].replacingOccurrences(of: "\t", with: ""))
                            }
                            else{
                                if(sizes[i].replacingOccurrences(of: "\t", with: "") != ""){
                                self.dayArray.append(sizes[i].replacingOccurrences(of: "\t", with: ""))
                                }
                            }
                            i=i+1
                                                }
                                                
                                                for i in 0..<self.monthArray.count{
                                                print(self.monthArray[i])
                                                
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
    

    @IBAction func getNowtani(_ sender: Any) {
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


                                    

