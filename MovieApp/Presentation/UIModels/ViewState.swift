//
//  ViewState.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

enum ViewState {
    case idle
    case loading
    case error(String)
    case dataLoaded
}
