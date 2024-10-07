//
//  ContentView.swift
//  MyanEats
//
//  Created by Kaung Min Khant on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activeTab: TabModel = .home
    @State private var istabBarHidden: Bool = false
    
    var body: some View {
        
        if #available(iOS 18, *){
            TabView (selection: $activeTab){
                Tab.init(value: .home){
                    Text("Home")
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
                Tab.init(value: .search){
                    Text("Search")
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
                Tab.init(value: .cart){
                    Text("Cart")
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
                Tab.init(value: .profile){
                    Text("Profile")
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
            }
            
        } else {
            TabView(selection: $activeTab){
                Text("Home")
                    .tag(TabModel.home)
                    .background {
                        if !istabBarHidden {
                            HideTabBar {
                                print ("Hidden")
                                istabBarHidden = true
                            }
                        }
                    }
                Text("Search")
                    .tag(TabModel.search)
                    
                Text("Cart")
                    .tag(TabModel.cart)
                   
                Text("Profile")
                    .tag(TabModel.profile)
                    
            }
            .overlay {
                Button {
                    activeTab = activeTab == .home ? .search : .home
                } label: {
                    Text("Switch Tabs")
                }
                .offset(y: 100)
            }
        }
    }
}

struct HideTabBar: UIViewRepresentable {
    
    var result: () -> ()
    func makeUIView(context: Context) ->  UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let tabController = view.tabController {
                tabController.tabBar.isHidden = true
                result()
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

extension UIView {
    var tabController: UITabBarController? {
        if let controller = sequence(first: self, next: {
            $0.next
        }).first(where: { $0 is UITabBarController }) as? UITabBarController {
            return controller
        }
        return nil
    }
}

#Preview {
    ContentView()
}
