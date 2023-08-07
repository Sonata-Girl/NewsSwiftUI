//
//  WebView.swift
//  NewsSwiftUI
//
//  Created by Sonata Girl on 29.06.2023.
//

import SwiftUI
import WebKit
import Foundation

struct WebView: UIViewRepresentable {
   
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl) {
                let request = URLRequest(url:url)
              
                DispatchQueue.main.async {
                    uiView.load(request)
                }
            }
        }
    }
}
