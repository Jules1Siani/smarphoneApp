//
//  CodableBundleExtension.swift
//  SmartPhoneApp
//
// create by Jules
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("JSON file not found \(file) in bundle")
        }
        
        // Create the property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        // Create the decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for the decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
          fatalError("Failed to decode \(file) from bundle.")
        }
        
        // Return the data
        return decodedData
    }
        
}
