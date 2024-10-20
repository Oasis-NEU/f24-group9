//
//  MainTabView.swift
//  choreChamp_frontEnd
//
//  Created by Jayden Ngo on 10/17/24.
//

import SwiftUICore
import SwiftUI

// The main TabView for bottom navigation
struct MainTabView: View {
    var body: some View {
        TabView {
            // Home Tab
            ContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            // Friends Tab
            FriendsView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Friends")
                }

            // Profile Tab
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(.blue)  // Custom accent color for selected item
        .padding(.top, 10)
        .background(RoundedCorners(color: .white, tl: 30, tr: 30, bl: 0, br: 0)
                        .shadow(radius: 5))  // Rounded and shadow effect for tab bar
    }
}

// Custom view modifier for rounded corners
struct RoundedCorners: View {
    var color: Color = .white
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height

                // Start from bottom left corner
                path.move(to: CGPoint(x: 0, y: h - bl))

                // Bottom left corner
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addQuadCurve(to: CGPoint(x: tl, y: 0), control: CGPoint(x: 0, y: 0))

                // Top left corner
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addQuadCurve(to: CGPoint(x: w, y: tr), control: CGPoint(x: w, y: 0))

                // Top right corner
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addQuadCurve(to: CGPoint(x: w - br, y: h), control: CGPoint(x: w, y: h))

                // Bottom right corner
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addQuadCurve(to: CGPoint(x: 0, y: h - bl), control: CGPoint(x: 0, y: h))
            }
            .fill(self.color)
        }
    }
}
