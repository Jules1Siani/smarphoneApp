//
//  CategoryModel.swift
//  SmartphoneApp
//  create by Jules 


import SwiftUI

struct Category: Identifiable, Codable {
    let id: Int
    let name: String
    let image: String
    let colorName: String?
    
    var color: Color {
        switch colorName?.lowercased() {
        case "red": return .red
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "orange": return .orange
        case "pink": return .pink
        case "gray": return .gray
        default: return .white 
        }
    }
}
