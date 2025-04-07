//
//  CategoryItemView.swift
//  SmartphoneApp
//  create by Jules Mickael


import SwiftUI

struct CategoryItemView: View {
    //Mark: - Property
    let category: Category
    
    //Mark: - Body
    
    var body: some View {
        Button(action: {}, label: {
            HStack(alignment: .center, spacing: 6){
                Image(category.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.gray)
                Text(category.name.uppercased())
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                Spacer()
                
            }//: HSTACK
            .padding()
            .background(category.color.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
                )
        })//:BUTTON
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(category: categories[0])
            .previewLayout(.sizeThatFits)
            .background(Color("ColorBackground"))
            .padding()
    }
}
