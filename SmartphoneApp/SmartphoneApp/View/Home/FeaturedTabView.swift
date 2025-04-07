//
//  FeaturedTabView.swift
//  SmartphoneApp
//  create by Jules Mickael

import SwiftUI

struct FeaturedTabView: View {
    // Timer to automatically switch slides every 2 seconds
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    // Keeps track of the currently visible banner index
    @State private var currentIndex = 0

    var body: some View {
        TabView(selection: $currentIndex) {
            // Loop through each player image
            ForEach(players.indices, id: \.self) { index in
                FeaturedItemView(player: players[index])
                    .resizableBannerStyle() // Custom modifier to make image fill space
                    .tag(index) // Needed for tracking the selected index
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.width / 1.1 // ✅ Full width, custom height
        )
        .onReceive(timer) { _ in
            // Auto-switch to the next banner
            withAnimation {
                currentIndex = (currentIndex + 1) % players.count
            }
        }
    }
}

// MARK: - Preview
struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
            .background(Color.gray) // Just for preview
    }
}

// MARK: - Custom View Modifier for full banner fit
extension View {
    func resizableBannerStyle() -> some View {
        self
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 1.1)
            .clipped() // Ensure the image doesn't overflow
    }
}
