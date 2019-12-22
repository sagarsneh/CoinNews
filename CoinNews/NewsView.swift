//
//  ContentView.swift
//  CoinNews
//
//  Created by Sneh Sagar on 19/12/19.
//  Copyright © 2019 Sneh Sagar. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import WebKit

struct NewsView: View {
    @ObservedObject var news = News()
    @State private var searchTerm : String = ""
    
    var body: some View {
        NavigationView {
            List{
                SearchBar(text: $searchTerm)
                ForEach(self.news.news.filter({ (NewsItem) -> Bool in
                    self.searchTerm.isEmpty ? true : NewsItem.title.localizedStandardContains(self.searchTerm)
                })) { newsItem in
                   NavigationLink( destination: webView(url: newsItem.url).navigationBarTitle("", displayMode: .inline)){
                        CardView(news: newsItem)
                    }
                }
                
            }.navigationBarTitle("Top News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

struct CardView: View {
    var news: NewsItem;
    
    var body: some View {
        HStack{
            if !news.imageURL.isEmpty {
                AnimatedImage(url: URL(string: news.imageURL)!)
                .resizable()
                .frame(width: 60, height: 60).clipShape(Circle()).shadow(radius: 5)
            }
            Text(news.title).fontWeight(.light).lineLimit(2)
        }
    }
    
}


