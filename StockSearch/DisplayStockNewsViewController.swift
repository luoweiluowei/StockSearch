//
//  DisplayStockNewsViewController.swift
//  StockSearch
//
//  Created by 罗崴 on 11/8/19.
//  Copyright © 2019 (I) Haiyu Tian. All rights reserved.
//

import UIKit

class DisplayStockNewsViewController: UIViewController {


    @IBOutlet weak var newstitle: UITextField!
    
    var newsTitle = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        newstitle.text = newsTitle

        // Do any additional setup after loading the view.
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
