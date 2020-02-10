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


class Common: NSObject {
    
    static func getUserDefaults(key: String) -> Any? {
        
        let userDefaults = UserDefaults.standard
        let data = userDefaults.object(forKey: key) as? Data
        
        if data != nil {
            return NSKeyedUnarchiver.unarchiveObject(with: data!)
        }
        else {
            return nil
        }
    }
    
    static func setUserDefaults(value : Any, key: String) -> Void {
        
        let userDefaults = UserDefaults.standard
        let data : Data = NSKeyedArchiver.archivedData(withRootObject: value)
        
        userDefaults.set(data, forKey: key)
        userDefaults.synchronize()
    }
}

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

       performSegue(withIdentifier: "goToNext", sender: self)
        webvieww.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                                       completionHandler: { (html: Any?, error: Error?) in
                                                        self.nowhtml = html as? String
                                                        if let doc = try? HTML(html: self.nowhtml, encoding: .utf8){
                                       var sizes = [String]()
                                                           
                                        for link in doc.xpath("//td[@class='']") {
                                            sizes.append(link.text!.replacingOccurrences(of: "\n", with: ""))
                                             
                                        }
                                //ud.set(sizes, forKey: "gett")
                                  
            Common.setUserDefaults(value: sizes, key: "hoge")
                                                            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                                                                if segue.identifier == "goToNext" {
                                                                    let nextVC = segue.destination as! zikanwari2
                                                                    nextVC.printData = "sizes"
                                                                }
                                                            }
                                                }
                    }
            )

        
        }
        

    }
