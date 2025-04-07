//
//  Constant.swift
//  TouchDownApp
//
//  Created by Louise Rennick on 2025-03-03.
//

import SwiftUI
// DATA
let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")    
let brands: [Brand] = Bundle.main.decode("brand.json")


// Color
let colorBackground: Color = Color("Background")
let colorGrey: Color = Color(UIColor.systemGray4)


// Layout
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing),count: 2)
}
//UX
//API
//IMAGE
//FONT
//String
//Misc


