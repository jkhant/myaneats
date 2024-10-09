//
//  Tab.swift
//  MyanEats
//
//  Created by Kaung Min Khant on 10/7/24.
//

import SwiftUI

enum TabModel: String, CaseIterable {
    case home = "house"
    case search = "magnifyingglass"
    case map = "map"
    case recipe = "fork.knife"
    case cart = "cart"
    case profile = "person.crop.circle"
    
    
    var title: String {
        switch self {
            case .home: "Home"
            case .search: "Search"
            case .cart: "Cart"
            case .profile: "Profile"
            case .map : "Map"
            case .recipe: "Recipe"
        }
    }
}
