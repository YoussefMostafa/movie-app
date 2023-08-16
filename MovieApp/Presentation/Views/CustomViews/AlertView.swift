//
//  AlertView.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 16/08/2023.
//

import SwiftUI

/// todo: create custom alert view instead of the text that represents the error
struct AlertView: View {
    private var message: String
    
    init(message: String) {
        self.message = message
    }
    
    var body: some View {
        VStack {
            Text("Error")
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text(message)
                .font(.caption)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.bottom)
        }
    }
    
}
