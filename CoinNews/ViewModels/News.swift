//
//  CoinNews.swift
//  CoinNews
//
//  Created by Sneh Sagar on 19/12/19.
//  Copyright © 2019 Sneh Sagar. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class News : ObservableObject {
    @Published var news = [NewsItem]()
    let URL = "https://newsapi.org/v2/top-headlines?country=us&pageSize=15&apiKey=1f822ed5f59c45efb3cf300cd307a162"
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
        Alamofire.request(URL).responseData { (data) in
            let json = try! JSON(data: data.data!)
            for i in json["articles"] {
                self.news.append(NewsItem(title: i.1["title"].stringValue, description: i.1["description"].stringValue , imageURL: i.1["urlToImage"].stringValue, url: i.1["url"].stringValue ))
            }
        }
    }
    
}
