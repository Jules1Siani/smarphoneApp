//
//  NavigationBarView.swift
//  SmartphoneApp
//   create by Jules Mickael


import SwiftUI

struct NavigationBarView: View {
    // MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    @Binding var cartItems: [CartItem] // 👈 Binding depuis ContentView

    // MARK: - BODY
    var body: some View {
        HStack {
            // 🔍 Search button (placeholder)
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            })

            Spacer()

            // 🔆 Logo with animation
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.isAnimated.toggle()
                    }
                }

            Spacer()

            // 🛒 Cart button with badge
            NavigationLink(destination: CartView(cartItems: $cartItems)) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)

                    if cartItems.count > 0 {
                        Text("\(cartItems.count)")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .frame(width: 16, height: 16)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 10, y: -10)
                    }
                }
            }
        } //: HSTACK
        .padding(.horizontal)
    }
}

// MARK: - PREVIEW
struct NavigationBarView_Previews: PreviewProvider {
    @State static var previewCart: [CartItem] = []

    static var previews: some View {
        NavigationBarView(cartItems: $previewCart)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
