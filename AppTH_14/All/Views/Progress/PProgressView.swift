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
    }
}

#Preview {
    PProgressView(viewModel: HabitsViewModel())
}
