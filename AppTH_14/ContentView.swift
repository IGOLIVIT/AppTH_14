//
//  ContentView.swift
//  AppTH_14
//
//  Created by IGOR on 15/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Habits

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        HabitsView()
                            .tag(Tab.Habits)
                        
                        PProgressView(viewModel: HabitsViewModel())
                            .tag(Tab.Progress)

                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                S1()
            }
        }
    }
}

#Preview {
    ContentView()
}
