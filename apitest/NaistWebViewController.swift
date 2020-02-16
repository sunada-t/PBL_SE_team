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
     var ippan1 = 0
    var joron2 = 0
    var senmonkamoku = 0
    var pbl = 0
    var remain = 0
    override func viewDidLoad() {
        
        if(Common.getUserDefaults(key: "aaa") != nil){
            ippan1 = Int(Common.getUserDefaults(key: "aaa")as! Double)
        
            joron2 = Int(Common.getUserDefaults(key: "bbb")as! Double)
        
            senmonkamoku = Int(Common.getUserDefaults(key: "ccc")as! Double)
        
            pbl = Int(Common.getUserDefaults(key: "eee")as! Double)
        }
        
        
        
        super.viewDidLoad()
        
        joron.progress = Float(joron2/3)
        ippan.progress = Float(ippan1/4)
        sennmonkuso.progress = Float(senmonkamoku/12)
        pblb.progress = Float(pbl/2)
        jo.text = "\(String(Int(joron2)))/3"
        ipp.text = "\(String(Int(ippan1)))/4"
        sen.text = "\(String(Int(senmonkamoku)))/12"
        pbll.text = "\(String(Int(pbl)))/2"
        if(Float(joron2/3)>1){
            remain = remain + (3-joron2)
        }
        if(Float(ippan1/4)>1){
            remain = remain + (4-ippan1)
        }
        if(Float(senmonkamoku/12)>1){
            remain = remain + (12-senmonkamoku)
        }
        if(Float(pbl/2)>1){
            remain = remain + (2-pbl)
        }
        
        engurah.value = CGFloat(((21-remain)/remain)*100)
          }


    
    }

