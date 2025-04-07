//
//  CartView.swift
//  SmartphoneApp
//
//  Created by Jules Mickael on 2025-03-23.
//

import SwiftUI

struct CartView: View {
    @Binding var cartItems: [CartItem]
    
    var body: some View {
        NavigationView {
            VStack {
                if cartItems.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "cart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .foregroundColor(.gray)
                        
                        Text("Your cart is empty")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 50)
                } else {
                    List {
                        ForEach($cartItems) { $item in
                            HStack {
                                Image(item.product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .background(Color(red: item.product.red, green: item.product.green, blue: item.product.blue))
                                    .cornerRadius(12)

                                VStack(alignment: .leading) {
                                    Text(item.product.name)
                                        .fontWeight(.semibold)
                                    
                                    Text(item.product.formattedPrice)
                                        .foregroundColor(.gray)
                                    
                                    Stepper("Qty: \(item.quantity)", value: $item.quantity, in: 1...10)
                                }
                                Spacer()
                                
                                Button(action: {
                                    if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
                                        cartItems.remove(at: index)
                                    }
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    
                    VStack(spacing: 15) {
                        HStack {
                            Text("Total:")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Text(totalPriceFormatted)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal)

                        //Go to CheckoutView
                        NavigationLink(destination: CheckoutView(cartItems: $cartItems)) {
                            Text("Proceed to Checkout")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("My Cart 🛍️")
        }
    }

    private var totalPriceFormatted: String {
        let total = cartItems.reduce(0) { $0 + ($1.product.price * $1.quantity) }
        return "$\(total)"
    }
}

// MARK: - Preview
struct CartView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var previewCartItems = [
            CartItem(product: products[0], quantity: 1),
            CartItem(product: products[1], quantity: 2)
        ]
        
        var body: some View {
            CartView(cartItems: $previewCartItems)
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
