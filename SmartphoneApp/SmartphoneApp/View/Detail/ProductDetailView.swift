//
//  ProductDetailView.swift
//  SmartphoneApp
//
//  Created by Jules Mickael on 2025-03-23.
//
import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @Binding var cartItems: [CartItem]
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAddedMessage = false
    @State private var showCart = false

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(red: product.red, green: product.green, blue: product.blue).opacity(0.15))
                .scaleEffect(1.3)
                .rotationEffect(.degrees(15))
                .offset(y: -200)

            VStack(alignment: .leading, spacing: 20) {
                
                // 🔙 Back + Title + Cart Button
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    }

                    Text("Product Details")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.leading, 8)

                    Spacer()

                    // 🛒 Cart icon with badge
                    Button(action: {
                        showCart = true
                    }) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "cart")
                                .font(.title2)
                                .foregroundColor(.black)

                            if cartItems.count > 0 {
                                Text("\(cartItems.count)")
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 10, y: -10)
                            }
                        }
                    }
                    .sheet(isPresented: $showCart) {
                        CartView(cartItems: $cartItems)
                    }
                }
                .padding(.horizontal)

                // Product image
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: product.red, green: product.green, blue: product.blue))
                    .cornerRadius(20)
                    .padding(.horizontal)

                // Name & price
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name)
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                    Text(product.formattedPrice)
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                // Description
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                Spacer()

                // ➕ Add to cart
                Button(action: {
                    if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
                        cartItems[index].quantity += 1
                    } else {
                        cartItems.append(CartItem(product: product, quantity: 1))
                    }
                    
                    showAddedMessage = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showAddedMessage = false
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Add to Cart")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                        .padding(.horizontal)
                }
                .padding(.bottom)
            }
            .padding(.top)

            // Pop-up feedback
            if showAddedMessage {
                VStack {
                    Spacer()
                    Text("✅ Added to Cart!")
                        .padding()
                        .background(Color.green.opacity(0.9))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .transition(.scale)
                        .padding(.bottom, 40)
                }
                .animation(.easeInOut, value: showAddedMessage)
            }
        }
        .navigationBarHidden(true)
    }
}

// MARK: - Preview
struct ProductDetailView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var previewCartItems: [CartItem] = []

        var body: some View {
            ProductDetailView(product: products[0], cartItems: $previewCartItems)
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
