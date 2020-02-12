//
//  TrainSearchViewController.swift
//  apitest
//
//  Created by hiromu-m on 2020/02/12.
//  Copyright © 2020 hiromu-m. All rights reserved.
//

import UIKit
import WebKit
class TrainSearchViewController: UIViewController,UISearchBarDelegate,UIScrollViewDelegate,WKNavigationDelegate{
    let sitemei = ["to目的地","from現在地"]
    let siteles = ["https://transit.yahoo.co.jp/main/top?from=学研北生駒&to=駅名",
    "https://transit.yahoo.co.jp/main/top?from=学研北生駒&to=駅名"
        ]
  var saito = [1,1,1,1,0,0,0]
    let ud = UserDefaults.standard
    var sumurl: String!
    var sites = 0
    var titlett: String!
    var siteme:[String?] = []

    @IBOutlet weak var searchBar: UISearchBar!
    let webview = WKWebView()
    
    
    override func viewDidLoad() {
        webview.frame = view.bounds
        view.addSubview(webview)
        view.addSubview(searchBar)
        super.viewDidLoad()
        webview.navigationDelegate = self
        searchBar.delegate = self
        webview.scrollView.delegate = self
             //プレースホルダの指定
        searchBar.placeholder = "駅名・場所を入力"
        searchBar.scopeButtonTitles = sitemei as?[String]
    }
    
    
    
    
    
    
    
    @IBAction func backWeb(_ sender: Any) {
        webview.goBack()
    }
    
    
    
    
    @IBAction func forwardWeb(_ sender: Any) {
        webview.goForward()
    }

    
    @IBAction func searchWeb(_ sender: Any) {
        if searchBar.isHidden == true{
        searchBar.isHidden = false
        }else{
            searchBar.isHidden = true
            self.view.endEditing(true)
        }
        
    }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar:UISearchBar) {
        searchBar.endEditing(true)
        searchBar.isHidden = true
        self.navigationItem.title = searchBar.text
        titlett = searchBar.text
        if(sites == 0){
           sumurl="https://transit.yahoo.co.jp/search/result?flatlon=&fromgid=&from=愛媛&tlatlon=&togid=&to=" + searchBar.text!
        }else{
            sumurl="https://transit.yahoo.co.jp/main/top?from=" + searchBar.text! + "&to=学研北生駒"
        }
        
            
            
            sumurl = sumurl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                        if let url = URL(string: sumurl){
                              self.webview.load(URLRequest(url: url))
                                // Do any additional setup after loading the view.
                                print("-----------")
                                print(self.webview.url!)
                                print("-----------")

                                }
            
      
    }


    //@objc func keyboar
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        sites = selectedScope

}
}

      

    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
