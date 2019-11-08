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
                print(stockResult.symbol)
                
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
       
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

