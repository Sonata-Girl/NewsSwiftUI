//
//  DetailVew.swift
//  NewsSwiftUI
//
//  Created by Sonata Girl on 29.06.2023.
//

import SwiftUI
import WebKit

struct DetailVew: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailVew_Previews: PreviewProvider {
    static var previews: some View {
        DetailVew(url: "https://www.google.com")
    }
}
