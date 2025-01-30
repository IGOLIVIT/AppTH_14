//
//  PProgressView.swift
//  AppTH_14
//
//  Created by IGOR on 17/01/2025.
//

import SwiftUI

struct PProgressView: View {

    @StateObject var viewModel: HabitsViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Progress")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .medium))
                    
                    Spacer()

                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isReset = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                    })
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Active Habits")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .medium))
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Overcome Negative Habits")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("\(viewModel.nh)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Completed Positive Habits")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("\(viewModel.ph)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                        }
                        .padding(.bottom)
                        
                        Text("Habit Tracking")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .medium))
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Total Days with Positive Habits")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("\(viewModel.tdph)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Total Days Without Negative Habits")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("\(viewModel.tdnh)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                        }
                        .padding(.bottom)
                        
                        Text("Challenges")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .medium))
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Missed Positive Habits")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("\(viewModel.dmph)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Negative Habit Relapse")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("\(viewModel.dmnh)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                        }
                        .padding(.bottom)
                        
                        Text("Performance Metrics")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .medium))
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Positive Habit Success Rate")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                if viewModel.habits.isEmpty {
                                    
                                    Text("0")
                                        .foregroundColor(.white)
                                        .font(.system(size: 32, weight: .semibold))
                                    
                                } else {
                                    
                                    Text("\(viewModel.pp)%")
                                        .foregroundColor(.white)
                                        .font(.system(size: 32, weight: .semibold))
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Negative Habit Avoidance Rate")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                if viewModel.habits.isEmpty {
                                    
                                    Text("0")
                                        .foregroundColor(.white)
                                        .font(.system(size: 32, weight: .semibold))
                                    
                                } else {
                                    
                                    Text("\(viewModel.np)%")
                                        .foregroundColor(.white)
                                        .font(.system(size: 32, weight: .semibold))
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                        }
                        .padding(.bottom)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isReset = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Reset Statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    Text("Are you sure you want to reset the statistics? This action cannot be undone.")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)

                    Rectangle()
                        .fill(.gray.opacity(0.2))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 7)
                    
                    HStack {
                        
                        Button(action: {
                    
                            withAnimation(.spring()) {
                                
                                viewModel.isReset = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.pp = String("0")
                            viewModel.np = String("0")
                            viewModel.tdnh = 0
                            viewModel.tdph = 0
                            viewModel.dmnh = 0
                            viewModel.dmph = 0
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isReset = false
                            }
                            
                        }, label: {
                            
                            Text("Reset")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    PProgressView(viewModel: HabitsViewModel())
}
