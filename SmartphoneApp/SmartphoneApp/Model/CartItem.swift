//
//  CartItem.swift
//  SmartphoneApp
//
//  Created by Jules Mickael on 2025-03-23.
//

import Foundation

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}
