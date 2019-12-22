//
//  CoinNewsItem.swift
//  CoinNews
//
//  Created by Sneh Sagar on 19/12/19.
//  Copyright © 2019 Sneh Sagar. All rights reserved.
//

import Foundation

struct NewsItem : Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var imageURL: String
    var url: String
}
