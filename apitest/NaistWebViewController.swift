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
    
    
    
    
    let ippan1 = Common.getUserDefaults(key: "aaa")as! Double
    let joron2 = Common.getUserDefaults(key: "bbb")as! Double
    let senmonkamoku = Common.getUserDefaults(key: "ccc")as! Double
    let pbl = Common.getUserDefaults(key: "eee")as! Double
    
    override func viewDidLoad() {
        super.viewDidLoad()
        engurah.value = 90
        joron.progress = Float(joron2/3)
        ippan.progress = Float(ippan1/4)
        sennmonkuso.progress = Float(senmonkamoku/12)
        pblb.progress = Float(pbl/2)
        jo.text = String(Int(joron2))
        ipp.text = String(Int(ippan1))
        sen.text = String(Int(senmonkamoku))
        pbll.text = String(Int(pbl))
          }


    
    }

