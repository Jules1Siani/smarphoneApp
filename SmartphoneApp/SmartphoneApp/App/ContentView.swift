//
// create by Jules 
//  ContentView.swift
//  SmartphoneApp
//

import SwiftUI

struct ContentView: View {
    @State private var cartItems: [CartItem] = [] // Cart data

    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    
                    // Navigation Bar with Safe Area and cart count
                    NavigationBarView(cartItems: $cartItems)
                        .padding(.horizontal, 15)
                        .padding(.top, getSafeAreaTop())
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                        .ignoresSafeArea(.container, edges: .top)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            
                            // Slider Banner
                            FeaturedTabView()
                                .frame(height: UIScreen.main.bounds.width / 1.1)

                            // Categories
                            CategoryGridView()
                            
                            // Section Title
                            HStack {
                                Text("Smartphones")
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.black)
                                    .shadow(color: Color.gray.opacity(0.3), radius: 1, x: 1, y: 2)
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 10)
                            .padding(.bottom, 5)

                            // Products Grid
                            LazyVGrid(columns: gridLayout, spacing: 15) {
                                ForEach(products) { product in
                                    ProductItemView(product: product, cartItems: $cartItems) //Cart binding aussi ici
                                }
                            }
                            .padding()

                            // Brand Section
                            HStack {
                                Text("Our Brands")
                                    .font(.system(size: 28, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.black)
                                    .shadow(color: Color.gray.opacity(0.3), radius: 1, x: 1, y: 2)
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 10)
                            .padding(.bottom, 5)

                            BrandGridView()
                            FooterView()
                                .padding(.horizontal)
                        }
                    }
                    .background(colorBackground.ignoresSafeArea())
                }
            }
            .navigationBarHidden(true)
        }
    }

    // MARK: - Top Safe Area Handling
    private func getSafeAreaTop() -> CGFloat {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first else {
            return 0
        }
        return keyWindow.safeAreaInsets.top
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
