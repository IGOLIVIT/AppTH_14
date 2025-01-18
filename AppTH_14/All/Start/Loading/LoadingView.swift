//
//  LoadingView.swift
//  AppTH_14
//
//  Created by IGOR on 16/01/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 190)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 60)
            }
        }
    }
}

#Preview {
    LoadingView()
}
