//
//  BitcoinWebViewController.swift
//  newsApp
//
//  Created by Adarsh Sinha on 26/03/18.
//  Copyright © 2018 Adarsh Sinha. All rights reserved.
//

import UIKit
import SwiftyJSON

class BitcoinWebViewController: UIViewController {
    
      var news = [News1]()

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        downloadJSON()

        // Do any additional setup after loading the view.
    }
    
    func downloadJSON () {
        
        let jsonURL = "https://newsapi.org/v2/everything?q=bitcoin&sortBy=publishedAt&apiKey=63f4e0af8d784e0482188f55936862ac"
        guard let url = URL(string: jsonURL) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, resopnse, error) in
            guard let data = data else { return }
            print(data)
            let json = JSON(data)
            print(json)
            DispatchQueue.main.sync {
                for i in 0...20{
                    //   let new = News1(url: json["articles"][i]["url"].url!)
                    
                    //   self.news.append(new)
                    
                    guard let url = json["articles"][i]["url"].url else {return}
                    
                    self.webView.loadRequest(URLRequest(url: url))
                    
                }
            }
            
            
            }.resume()
    }
    
    
    

}
