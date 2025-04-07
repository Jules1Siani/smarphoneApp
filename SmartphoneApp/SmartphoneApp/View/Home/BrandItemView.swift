//
//  BrandItemView.swift
// SmartphoneApp
// create by Jules Mickael


import SwiftUI

struct BrandItemView: View {
    //Mark: - Property
    let brand: Brand
    
    //Mark: - Body

    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .padding(3)
            .background(Color.white.cornerRadius(12))
            .background(//Mark: - placeholder
                RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1)
            )
            .frame(width: 100, height: 100)
    }
}

struct BrandItemView_Previews: PreviewProvider {
    static var previews: some View {
        BrandItemView(brand: brands[0])
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
            .padding()
    }
}
