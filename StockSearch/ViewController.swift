//
//  ViewController.swift
//  StockSearch
//
//  Created by (I) Haiyu Tian on 10/17/19.
//  Copyright © 2019 (I) Haiyu Tian. All rights reserved.
//

import UIKit
import Foundation



struct WebsiteResult: Decodable
{
    let data: [StockNews]
}



struct StockNews: Decodable {
    let title: String?
    let news_url: String?
    let image_url: String?
    let text: String?
    let sentiment: String?
    let type: String?
    let source_name: String?
    let date: String?
    let tickers: [String]?
    let topics: [String]?
}


struct StockResult: Decodable
{
    let symbol: String?
    let price: double_t?
    
}


class ViewController: UIViewController {
    
    @IBOutlet weak var getStockButton: UIButton!
    @IBOutlet weak var stockInfo: UIButton!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var DisplayStockInfo = segue.destination as! DisplayStockInfoViewController
        DisplayStockInfo.myString = "Stock Name: APPL"
        DisplayStockInfo.stockPrice = "Stock Price: $123.2"
    }
    
    @IBAction func didPressedGetStockButton(_ sender: UIButton) {
        guard let url = URL(string: "https://financialmodelingprep.com/api/v3/stock/real-time-price/AAPL") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                let stockResult  = try
                    JSONDecoder().decode(StockResult.self, from: dataResponse);
                //print the first element from the websiteResult array
                print(stockResult)
                
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
        performSegue(withIdentifier: "segue" , sender: self)

//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "DisplayStockInfo") as UIViewController
//        vc.label = "12345"
//        self.present(vc, animated: true, completion: nil)
        
       
    }
    
    @IBAction func didPressedGetStockNewsButton(_ sender: Any) {
        guard let url = URL(string: "https://stocknewsapi.com/api/v1?tickers=FB&items=50&token=p6jtyjvg9ipxczr5loks0f3kqd4oqvz25bbglo5m") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                let websiteResult  = try
                    JSONDecoder().decode(WebsiteResult.self, from: dataResponse);
                //print the first element from the websiteResult array
                print(websiteResult.data[0])
                
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let myStockNews = StockNews(title: "myTitle", newsUrl: "myNews", imageUrl: "myImage", text: "myText", sentiment: "mySentiment", type: "myType", sourceName: "mySource", date: "myDate", tickers: [], topics:[])
//        print(myStockNews)
        
    }


}

