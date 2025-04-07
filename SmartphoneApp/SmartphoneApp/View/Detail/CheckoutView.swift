//
//  CheckoutView.swift
//  SmartphoneApp
//
//  Created by Jules Mickael on 2025-03-23.
//

import SwiftUI

struct CheckoutView: View {
    @Binding var cartItems: [CartItem]
    
    @State private var name = ""
    @State private var address = ""
    @State private var email = ""
    @State private var showConfirmation = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Order Summary
                    Text("Order Summary")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ForEach(cartItems) { item in
                        HStack {
                            Text("\(item.product.name) x\(item.quantity)")
                            Spacer()
                            Text("$\(item.product.price * item.quantity)")
                        }
                        .padding(.vertical, 4)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Total")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(totalPriceFormatted)
                            .font(.title3)
                            .fontWeight(.bold)
                    }

                    Divider()
                    
                    // User Info Form
                    Group {
                        TextField("Full Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Shipping Address", text: $address)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Email Address", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                    }

                    // Confirm Order Button
                    Button(action: {
                        showConfirmation = true
                    }) {
                        Text("Confirm Order")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.top, 10)
                }
                .padding()
            }
            .navigationTitle("Checkout")
            .alert(isPresented: $showConfirmation) {
                Alert(
                    title: Text("Order Confirmed 🎉"),
                    message: Text("Thank you, \(name)! Your order has been placed."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    // Total price
    var totalPriceFormatted: String {
        let total = cartItems.reduce(0) { $0 + ($1.product.price * $1.quantity) }
        return "$\(total)"
    }
}

// MARK: - Preview
struct CheckoutView_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var previewCartItems = [
            CartItem(product: products[0], quantity: 1),
            CartItem(product: products[1], quantity: 2)
        ]
        
        var body: some View {
            CheckoutView(cartItems: $previewCartItems)
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
