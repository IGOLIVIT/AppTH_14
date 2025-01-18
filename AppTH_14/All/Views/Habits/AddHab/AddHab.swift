//
//  AddHab.swift
//  AppTH_14
//
//  Created by IGOR on 16/01/2025.
//

import SwiftUI

struct AddHab: View {
    
    @StateObject var viewModel: HabitsViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
     
                ZStack {
                    
                    Text("New habit")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curType = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.curType == index ? .black : .white.opacity(0.2))
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim").opacity(viewModel.curType == index ? 1 : 0)))
                                })
                            }
                        }
                        .padding(2)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(0.1)))
                        .padding(.bottom)
                        
                        Text("Habbit name")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.hName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.hName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.gray.opacity(0.5))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom)
                        
                        HStack {
                            
                            VStack {
                                
                                Text("Duration goal")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ZStack(content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.hGoal.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.hGoal)
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                
                                Rectangle()
                                    .fill(.gray.opacity(0.5))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                            .frame(maxWidth: .infinity)
                            
                            Text("How many days do you want to maintain this habit?")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                        }
                        .padding(.bottom, 80)
                        
                        Button(action: {
                            
                            if viewModel.curType == "Positive" {
                                
                                viewModel.ph += 1
                                
                            } else {
                                
                                viewModel.nh += 1

                            }
                            
                            viewModel.hDays = String("\(0)")
                            
                            viewModel.hType = viewModel.curType
                            
                            viewModel.addHabit()
                            
                            viewModel.hName = ""
                            viewModel.hGoal = ""
                            
                            viewModel.fetchHabits()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("+ Save and add")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 180, height: 50)
                                .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        })
                        .opacity(viewModel.hName.isEmpty || viewModel.hGoal.isEmpty ? 0.3 : 1)
                        .disabled(viewModel.hName.isEmpty || viewModel.hGoal.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddHab(viewModel: HabitsViewModel())
}
