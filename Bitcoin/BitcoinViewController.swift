//
//  BitcoinViewController.swift
//  newsApp
//
//  Created by Adarsh Sinha on 26/03/18.
//  Copyright © 2018 Adarsh Sinha. All rights reserved.
//

import UIKit
import SwiftyJSON

class BitcoinViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var news = [News]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        downloadJSON()
        
    }
    
    func downloadJSON () {
        
        let jsonURL = "https://newsapi.org/v2/everything?q=bitcoin&sortBy=publishedAt&apiKey=63f4e0af8d784e0482188f55936862ac"
        guard let url = URL(string: jsonURL) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, resopnse, error) in
            guard let data = data else { return }
            //    print(data)
            let json = JSON(data)
            //    print(json)
            DispatchQueue.main.sync {
                for i in 0...20{
                    let new = News(title: json["articles"][i]["title"].stringValue, auth: json["articles"][i]["author"].stringValue, url: json["articles"][i]["url"].stringValue)
                    self.news.append(new)
                    self.tableView.reloadData()
                }
            }
            
            
            }.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BitcoinTableViewCell
        cell.title.text = news[indexPath.row].title
        cell.author.text = news[indexPath.row].auth
        
        
        
        
        
        
        return cell
    }

        
    

   
}
