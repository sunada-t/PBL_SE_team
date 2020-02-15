//
//  homeViewController.swift
//  apitest
//
//  Created by hiromu-m on 2020/02/15.
//  Copyright © 2020 hiromu-m. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    @IBOutlet weak var comment1: UIImageView!
    
    @IBOutlet weak var gotoWeb: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func shika(_ sender: Any) {
        if(comment1.isHidden){
        comment1.isHidden = false
        gotoWeb.isHidden = false
        }else{
        comment1.isHidden = true
        gotoWeb.isHidden = true
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

}
