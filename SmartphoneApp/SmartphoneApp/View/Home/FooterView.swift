//
//  FooterView.swift
//  SmartphoneApp
//   create by Jules Mickael


import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 2 ){
            Text(" We offer the most cutting-edge,high-performance, and stylish smartphones available on the market. ")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            Image("logo-lineal")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(Color.gray)
                .layoutPriority(0)
            Text("Copyright © 2025 SmartphoneApp. All rights reserved.")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
            
        }//VStack
        .padding()
    }
}

struct FootFooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
