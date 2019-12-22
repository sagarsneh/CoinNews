//
//  WebView.swift
//  CoinNews
//
//  Created by Sneh Sagar on 19/12/19.
//  Copyright © 2019 Sneh Sagar. All rights reserved.
//

import SwiftUI
import WebKit

struct webView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: UIViewRepresentableContext<webView>) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<webView>) {
        
    }
}
