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
        dayd = row+1
    }
    
  
    
       var printData : String = ""
    var dayd = 1
    var monthInf:[[String?]] = []
    @IBOutlet weak var dayweek: UISegmentedControl!
    @IBOutlet weak var getu: UITextView!
    
    @IBOutlet weak var selectday: UIPickerView!
    @IBOutlet weak var ka: UITextView!
    
    @IBOutlet weak var sui: UITextView!
    
    @IBOutlet weak var moku: UITextView!
    
    @IBOutlet weak var kin: UITextView!
    
    func shokika(){
        dayweek.setTitle((Common.getUserDefaults(key: "one")as![String])[1], forSegmentAt: 0)
        dayweek.setTitle((Common.getUserDefaults(key: "two")as![String])[1], forSegmentAt: 1)
       dayweek.setTitle((Common.getUserDefaults(key: "three")as![String])[1], forSegmentAt: 2)
        dayweek.setTitle((Common.getUserDefaults(key: "four")as![String])[1], forSegmentAt: 3)
        dayweek.setTitle((Common.getUserDefaults(key: "five")as![String])[1], forSegmentAt: 4)
        var q = 2
       // print()
        while((Common.getUserDefaults(key: "one")as![String]).count > q){
       if((Common.getUserDefaults(key: "one")as![String])[q] == "1限目"){
         getu.text = (Common.getUserDefaults(key: "one")as![String])[q+1]
        q=q+1
        }
       else if((Common.getUserDefaults(key: "one")as![String])[q] == "2限目"){
         ka.text = (Common.getUserDefaults(key: "one")as![String])[q+1]
        q=q+1
        }
        else if((Common.getUserDefaults(key: "one")as![String])[q] == "3限目"){
         getu.text = (Common.getUserDefaults(key: "one")as![String])[q+1]
        q=q+1
        }
        else if((Common.getUserDefaults(key: "one")as![String])[q] == "4限目"){
         getu.text = (Common.getUserDefaults(key: "one")as![String])[q+1]
        q=q+1
        }
        else if((Common.getUserDefaults(key: "one")as![String])[q] == "5限目"){
         getu.text = (Common.getUserDefaults(key: "one")as![String])[q+1]
        q=q+1
        }
        q=q+1
        }
        
        
    }
    
    
    func dayShedule(k: Int){
        print(monthInf[k][1]!)
        Common.setUserDefaults(value:monthInf[k], key: "one")
        Common.setUserDefaults(value:monthInf[k+1], key: "two")
        Common.setUserDefaults(value:monthInf[k+2], key: "three")
        Common.setUserDefaults(value:monthInf[k+3], key: "four")
        Common.setUserDefaults(value:monthInf[k+4], key: "five")
        print(Common.getUserDefaults(key: "one") as Any)
        
        let a = Common.getUserDefaults(key: "one") as? String
        shokika()
    }
    
    
    @IBAction func makeWeek(_ sender: Any) {
        dayShedule(k: dayd)
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
