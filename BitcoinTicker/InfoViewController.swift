//
//  InfoViewController.swift
//  BitcoinTicker
//
//  Created by Tobias Ruano on 29/03/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import SwiftyJSON

class InfoViewController: UIViewController {
    
    @IBOutlet weak var nowPrice: UILabel!
    @IBOutlet weak var todayAverages: UILabel!
    @IBOutlet weak var weekAverages: UILabel!
    @IBOutlet weak var monthAverages: UILabel!
    
    var infoJson = JSON()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(infoJson)
        if let title: String = infoJson["display_symbol"].string {
            navigationController?.title = title
            navigationItem.title = title
        }
        
        setupInfo()
    }
    
    func setupInfo() {
        if let tempResult = infoJson["last"].double {
            let text = "\(tempResult)"
            nowPrice.text = text
            todayAverages.text = "\(infoJson["averages"]["day"].double!)"
            weekAverages.text = "\(infoJson["averages"]["week"].double!)"
            monthAverages.text = "\(infoJson["averages"]["month"].double!)"
        }else {
            nowPrice.text = "Price Unavailable"
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
