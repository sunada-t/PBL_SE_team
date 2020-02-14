//
//  zikanwari2.swift
//  
//
//  Created by tsubasa-s on 2020/02/09.
//

import UIKit
import WebKit
import Kanna



class zikanwari2: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 31
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return String(row+1)
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
       print(row+1)
        
    }
    
  
    
       var printData : String = ""
    
    var monthInf:[[String?]] = []
    @IBOutlet weak var dayweek: UISegmentedControl!
    @IBOutlet weak var getu: UITextView!
    
    @IBOutlet weak var selectday: UIPickerView!
    @IBOutlet weak var ka: UITextView!
    
    @IBOutlet weak var sui: UITextView!
    
    @IBOutlet weak var moku: UITextView!
    
    @IBOutlet weak var kin: UITextView!
    
    
    func dayShedule(i: Int){
          var k = 0
        while(i <= Int(monthInf[k][0]!)!){
              k=k+1
          }
        if(monthInf[k][1]! == "月"){
              print("祝日")
        
        }else if(monthInf[k][1]! == "火"){
                print("祝日")
          
        }else if(monthInf[k][1]! == "水"){
                  print("祝日")
            
        } else if(monthInf[k][1]! == "木"){
            print("祝日")
      
        }else if(monthInf[k][1]! == "金"){
            
        }
        Common.setUserDefaults(value:pbl, key: "月")
        
        
          
      }
    override func viewDidLoad() {
        
        if Common.getUserDefaults(key: "month") != nil{
             monthInf = Common.getUserDefaults(key: "month")as![[String]]
             print(monthInf)
        }
       
        
           super.viewDidLoad()
        dayweek.setTitle("月", forSegmentAt: 0)
        dayweek.setTitle("火", forSegmentAt: 1)
        dayweek.setTitle("水", forSegmentAt: 2)
        dayweek.setTitle("木", forSegmentAt: 3)
        dayweek.setTitle("金", forSegmentAt: 4)
        selectday.delegate = self
        selectday.dataSource = self
 dayweek.addTarget(self, action: #selector(segmentChanged(_:)), for: UIControl.Event.valueChanged)
       }

    @objc func segmentChanged(_ segment:UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            print("月")
        case 1:
            print("火")
        case 2:
            print("水")
        default:
            break
        }
    }
    //let a = Common.getUserDefaults(key: "getu")
}
