//
//  ContentView.swift
//  NewsSwiftUI
//
//  Created by Sonata Girl on 21.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    // наблюдатель
    @ObservedObject var networkManager = NetworkManager()
   
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailVew(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("Haker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
