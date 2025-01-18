//
//  S3.swift
//  AppTH_14
//
//  Created by IGOR on 16/01/2025.
//

import SwiftUI

struct S3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
             Image("s3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 18) {
                    
                    Text("Make progress!")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text("Track your habits daily and see how small steps lead to big changes.")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    
                    Button(action: {
                        
                        status = true
                        
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
    S3()
}
