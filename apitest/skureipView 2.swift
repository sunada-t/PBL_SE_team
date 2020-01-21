//
//  skureipView.swift
//  apitest
//
//  Created by hiromu-m on 2019/12/21.
//  Copyright © 2019 hiromu-m. All rights reserved.
//

import UIKit
import Alamofire
//スクレイピングしてくれるやつログインのない場合はかんなを使う
import Kanna



class skureipView: UIViewController, UITableViewDelegate, UITableViewDataSource { // ‥①
        var beefbowl = [Gyudon]()
        var myTableView1: UITableView!
        let textArry: [String] = [
        "1番めのセル","2番めのセル",
        "3番めのセルは長い文字列を設定して、\nセルの高さが自動的に調節されるようになるかを確認しようと思います。",
        "4番目のセル","5番目のセル"]
     
        override func viewDidLoad() {
            super.viewDidLoad()
            print("ssssss")
            getGyudonPrice()
            myTableView1 = UITableView(frame: self.view.frame, style: UITableView.Style.grouped) // ‥②
            myTableView1.delegate = self // ‥③
            myTableView1.dataSource = self // ‥③
            myTableView1.estimatedRowHeight = 100
            myTableView1.rowHeight = UITableView.automaticDimension
            self.view.addSubview(myTableView1)
        }
        
    func getGyudonPrice() -> Array<Any> {
    //スクレイピング対象のサイトを指定
    Alamofire.request("https://www.yoshinoya.com/menu/gyudon/gyu-don/").responseString { response in
            if let html = response.result.value {
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
                        self.beefbowl.append(gyudon)
                    }
                    //print("======================")
                    //print(self.beefbowl)
                    
                    self.myTableView1.reloadData()
                }
            }
        }
        return beefbowl
    }

    
        //④セクション数を指定
        func numberOfSections(in tableView: UITableView) -> Int {
            
            if beefbowl.isEmpty {
                print("カラ")
                return 3
            }else{
                print("\(beefbowl.count)こ取得")
                return beefbowl.count
            }
           
        }
        //④セクションタイトルを指定
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if beefbowl.isEmpty {
                print("カラ")
                return "\(section)"
            }else{
                return "\(beefbowl[section].size)"
            }
            
        }
        //④セル数を指定
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print("セル数：5")
            return 1
        }
        //④セルを生成
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print("セルの値を入れていく")
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                       reuseIdentifier: "aaa\(indexPath.section)-\(indexPath.row)")
           
            if beefbowl.isEmpty {
           
                cell.textLabel?.text = "セクション番号 : \(indexPath.section)"
            //cell.detailTextLabel?.text = "行番号 : \(indexPath.row)"
            //cell.detailTextLabel?.numberOfLines = 0
            //cell.detailTextLabel?.text = textArry[indexPath.row]
           // cell.imageView?.image = UIImage(named: "dog2.png")
            }else{
                 cell.textLabel?.text = "値段 : \(beefbowl[indexPath.section].price)"
                 //cell.detailTextLabel?.text = "行番号 : \(indexPath.row)"
                 //cell.detailTextLabel?.numberOfLines = 0
                 //cell.detailTextLabel?.text = textArry[indexPath.row]
                // cell.imageView?.image = UIImage(named: "dog2.png")
                
            }
            
            return cell
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    }
   
