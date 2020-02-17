//
//  NaistWebViewController.swift
//  apitest
//
//  Created by hiromu-m on 2020/01/21.
//  Copyright © 2020 hiromu-m. All rights reserved.
//fffsssssssssa

import UIKit
import MBCircularProgressBar



class NaistWebViewController: UIViewController{
    
    @IBOutlet weak var engurah: MBCircularProgressBarView!
    
    @IBOutlet weak var joron: UIProgressView!
    @IBOutlet weak var ippan: UIProgressView!
    @IBOutlet weak var sennmonkuso: UIProgressView!
    @IBOutlet weak var pblb: UIProgressView!
    
    @IBOutlet weak var jo: UILabel!
    @IBOutlet weak var ipp: UILabel!
    @IBOutlet weak var sen: UILabel!
    @IBOutlet weak var pbll: UILabel!
    @IBOutlet weak var assesment: UILabel!
    
    var ippan1 = 0.0
    var joron2 = 0.0
    var senmonkamoku = 0.0
    var pbl = 0.0
    
    override func viewDidLoad() {
         super.viewDidLoad()
        if(Common.getUserDefaults(key: "aaa") != nil){
            ippan1 = Common.getUserDefaults(key: "aaa")as! Double
            joron2 = Common.getUserDefaults(key: "bbb")as! Double
            senmonkamoku = Common.getUserDefaults(key: "ccc")as! Double
            pbl = Common.getUserDefaults(key: "eee")as! Double
        }
        caluunit()
        
          }
    
    func caluunit(){
            var remain = 0.0
             joron.progress = Float(joron2/3)
             ippan.progress = Float(ippan1/4)
             sennmonkuso.progress = Float(senmonkamoku/12)
             pblb.progress = Float(pbl/2)
             
             jo.text = "\(String(Int(joron2)))/3"
             ipp.text = "\(String(Int(ippan1)))/4"
             sen.text = "\(String(Int(senmonkamoku)))/12"
             pbll.text = "\(String(Int(pbl)))/2"
             
             if(Float(joron2/3)<1){
                 remain = remain + (3-joron2)
             }
             if(Float(ippan1/4)<1){
                 remain = remain + (4-ippan1)
             }
             if(Float(senmonkamoku/12)<1){
                 remain = remain + (12-senmonkamoku)
             }
             if(Float(pbl/2)<1){
                 remain = remain + (2-pbl)
             }
             
             engurah.value = CGFloat(Float((21-remain)/21)*100)
             
             if(engurah.value>=90){
                 assesment.text = "後は英語だけかな？残り卒論がんばろう！"
             }else if(engurah.value>=60){
                 assesment.text = "今が頑張りところ"
             }else if(engurah.value>=30){
                 assesment.text = "M1前半はテストが多いががんばろう"
             }else if(engurah.value >= 0){
                 assesment.text = "今が冬なら君は詰んでいるよ，潔く諦めよう"
             }
        
    }
    
    
    
    @IBAction func jorob(_ sender: Any) {
       joron2 = joron2 - 1
              caluunit()
    }
    

    @IBAction func ippb(_ sender: Any) {
        ippan1 = ippan1 - 1
               caluunit()
    }
    
    
    @IBAction func semonb(_ sender: Any) {
       senmonkamoku = senmonkamoku - 1
               caluunit()
    }
    
    
    @IBAction func pblbbb(_ sender: Any) {
        pbl = pbl - 1
               caluunit()
    }
    
    
    }

