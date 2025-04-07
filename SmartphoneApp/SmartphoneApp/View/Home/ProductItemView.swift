//
//  ProductItemView.swift
//  SmartphoneApp
//  create by Jules Mickael

import SwiftUI

struct ProductItemView: View {
    // MARK: - PROPERTY
    let product: Product
    @Binding var cartItems: [CartItem] // 👈 Ajout

    // MARK: - BODY
    var body: some View {
        NavigationLink(destination: ProductDetailView(product: product, cartItems: $cartItems)) {
            VStack(alignment: .leading, spacing: 6) {
                // PHOTO
                ZStack {
                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                }
                .background(Color(red: product.red, green: product.green, blue: product.blue))
                .cornerRadius(12)

                // NAME
                Text(product.name)
                    .font(.title3)
                    .fontWeight(.black)

                // PRICE
                Text(product.formattedPrice)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
        }
    }
}

// MARK: - PREVIEW
struct ProductItemView_Previews: PreviewProvider {
    @State static var cart: [CartItem] = []

    static var previews: some View {
        ProductItemView(product: products[0], cartItems: $cart)
            .previewLayout(.fixed(width: 200, height: 300))
            .padding()
            .background(colorBackground)
    }
}
