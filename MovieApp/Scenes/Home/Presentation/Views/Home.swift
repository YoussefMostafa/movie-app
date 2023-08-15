//
//  Home.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 13/08/2023.
//

import SwiftUI

struct Home: View {

//    @ObservedObject private var viewModel: Home
    
    var body: some View {
        NavigationStack {
//            List(messages) { message in
//                VStack(alignment: .leading) {
//                    Text(message.from)
//                        .font(.headline)
//                    Text(message.text)
//                }
                
                Text("x")
//            }
            .navigationTitle("Inbox")
        }.task {
            async {
                let data: [MovieDomainModel]? = try await MoviesRepository().fetchHome(page: 1)
                
            }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
