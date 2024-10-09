//
//  CustomTabBar.swift
//  MyanEats
//
//  Created by Kaung Min Khant on 10/7/24.
//

import SwiftUI

struct CustomTabBar: View {
    
    var activeForeground: Color = .white
    var activeBackground: Color = .blue
    @Binding var activeTab: TabModel
    @Namespace private var animation
    
    var body: some View {
        HStack (spacing: 0) {
            ForEach(TabModel.allCases, id: \.rawValue) { tab in
                Button {
                    activeTab = tab
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: tab.rawValue)
                            .font(.title3)
                            .frame(width: 30, height: 30)
                        
                        if activeTab == tab {
                            Text(tab.title)
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                    }
                    .foregroundStyle(activeTab == tab ? activeForeground : .gray)
                    .padding(.vertical, 2)
                    .padding(.leading, 10)
                    .padding(.trailing, 15)
                    .contentShape(.rect)
                    .background {
                        if activeTab == tab {
                            Capsule ()
                                .fill(activeBackground)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 5)
        .frame(height: 45)
        .background (
            .background
                .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                .shadow(.drop(color: .black.opacity(0.06), radius: 5, x: -5, y: -5)),
            in: .capsule
        )
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: activeTab)
    }
}


#Preview {
    ContentView()
}
