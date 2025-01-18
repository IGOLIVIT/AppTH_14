//
//  S2.swift
//  AppTH_14
//
//  Created by IGOR on 16/01/2025.
//

import SwiftUI

struct S2: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
             Image("s2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 18) {
                    
                    Text("Track Your Habits")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text("Easily log your progress for both positive and negative habits. Stay motivated every day!")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    
                    NavigationLink(destination: {
                        
                        S3()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(width: 100, height: 40)
                            .background(RoundedRectangle(cornerRadius: 3).fill(Color("tbg")))
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 260)
                .background(Color.black)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    S2()
}
