//
//  ViewController.swift
//  newsApp
//
//  Created by Adarsh Sinha on 23/03/18.
//  Copyright © 2018 Adarsh Sinha. All rights reserved.
//

import UIKit
import SwiftyJSON


struct News: Decodable {
    var title:String
    var auth:String
    var url: String
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var news = [News]()
 //   var articles = [Articles]()

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        

       
        downloadJSON()
//            print("JSON data printed")


          //  self.tableView.reloadData()
        
        
  
    }
    
    func downloadJSON () {
        
        let jsonURL = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=63f4e0af8d784e0482188f55936862ac"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WallStreetTableViewCell
        cell.title.text = news[indexPath.row].title
        cell.author.text = news[indexPath.row].auth
        
       
        
        
      
        
        return cell
    }

}

