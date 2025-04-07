//
//  LogoView.swift
//  SmartphoneApp
//  create by Jules Mickael

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack (spacing: 4){
            Text("Enjoy".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
            //text 1
            Image("logo-dark")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50,alignment: .center)
            //logo image
            
            Text("Phone".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
            //text 2
                
            
        }//:HSTACK
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
