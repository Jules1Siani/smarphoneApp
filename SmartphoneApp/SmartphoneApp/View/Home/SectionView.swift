//
//  SectionView.swift
//  SmartphoneApp
//   create by Jules Mickael
 

import SwiftUI

struct SectionView: View {
    @State var rotateClockwise: Bool
    var body: some View {
        VStack (spacing: 0){
            Spacer()
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
                
            Spacer()
        }//:VSTACK
        .background(Color.gray.cornerRadius(8))
        .frame(width: 85)
       
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(rotateClockwise: true)
            .previewLayout(.fixed(width: 120, height: 240))
            .padding()
            .background(Color.gray.opacity(0.2))
    }
}
