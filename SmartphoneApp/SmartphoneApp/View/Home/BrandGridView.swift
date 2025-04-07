//
//  BrandGridView.swift
//  SmartphoneApp
// create by Jules Mickael


import SwiftUI

struct BrandGridView: View {
    // MARK: - Property
    
    // MARK: - Body
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridLayout, spacing: columnSpacing) {
                    ForEach(brands) { brand in
                        BrandItemView(brand: brand)
                            .frame(width: 160, height: 160)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 5, y: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                            )
                            .padding(.horizontal, 8)
                            .scaleEffect(1.0)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0)) {
                                    // Add tap animation effect
                                }
                            }
                    }
                } //: Grid
                .frame(height: 220)
                .padding(15)
            } //: ScrollView
            
            // Left indicator
            HStack {
                Text("〈")
                    .font(.largeTitle)
                    .foregroundColor(.gray.opacity(0.4))
                    .padding(.leading, 2)
                
                Spacer()
                
                // Right indicator
                Text("〉")
                    .font(.largeTitle)
                    .foregroundColor(.gray.opacity(0.4))
                    .padding(.trailing, 2)
            }
        }
    }
}

struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
