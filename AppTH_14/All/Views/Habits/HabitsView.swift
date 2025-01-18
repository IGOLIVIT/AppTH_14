//
//  HabitsView.swift
//  AppTH_14
//
//  Created by IGOR on 16/01/2025.
//

import SwiftUI

struct HabitsView: View {
    
    @StateObject var viewModel = HabitsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("My habits")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .medium))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .regular))
                    })
                }
                .padding(.bottom, 25)
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.filterType = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white.opacity(viewModel.filterType == index ? 1 : 0.5))
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(viewModel.filterType == index ? 0.15 : 0)))
                        })
                    }
                }
                .padding(2)
                .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(0.1)))
                .padding(.bottom)
                
                if viewModel.habits.isEmpty {
                    
                    VStack(spacing: 12) {
                        
                        Image("pe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                        
                        Text("You haven't added any habits yet.")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(width: 200)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    if viewModel.habits.filter({($0.hType ?? "") == viewModel.filterType}).isEmpty {
                        
                        VStack(spacing: 12) {
                            
                            Image("pe")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                            
                            Text("You haven't added any habits yet.")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(width: 200)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.habits.filter({($0.hType ?? "") == viewModel.filterType})) { index in
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 16) {
                                            
                                            Text(index.hName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .medium))
                                            
                                            HStack {
                                                
                                                VStack(alignment: .leading, spacing: 7) {
                                                    
                                                    Text("Days with habit")
                                                        .foregroundColor(.white.opacity(0.5))
                                                        .font(.system(size: 12, weight: .regular))
                                                    
                                                    Text("\(index.hDays ?? "")/\(index.hGoal ?? "")")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 20, weight: .medium))
                                                }
                                                
                                                VStack(alignment: .leading, spacing: 7) {
                                                    
                                                    Text("Max days")
                                                        .foregroundColor(.white.opacity(0.5))
                                                        .font(.system(size: 12, weight: .regular))
                                                    
                                                    Text("\(index.hGoal ?? "")")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 20, weight: .medium))
                                                }
                                            }
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        if index.hDays == index.hGoal {
                                            
                                            VStack(alignment: .leading, spacing: 6) {
                                                
                                                Text("Habit Mastered!")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 17, weight: .medium))
                                                
                                                Text("You've reached your goal! Stay strong and keep going!")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 13, weight: .medium))
                                                
                                            }
                                            .padding(7)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim3")))
       
                                        } else {
                                            
                                            if index.hType == "Positive" {
                                                
                                                VStack {
                                                    
                                                    Button(action: {
                                                        
                                                        viewModel.selectedHabit = index
                                                        
                                                        viewModel.hNewDays = String("\(Int((Int(viewModel.selectedHabit?.hDays ?? "") ?? 0) + 1))")
                                                        
                                                        CoreDataStack.shared.updateHabit(withchName: viewModel.selectedHabit?.hName ?? "", hNewDays: viewModel.hNewDays)
                                                        
                                                        viewModel.fetchHabits()
                                                        
                                                        viewModel.tdph += 1
                                                        
                                                    }, label: {
                                                        
                                                        Text("Done")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 15, weight: .regular))
                                                            .frame(width: 110, height: 50)
                                                            .background(RoundedRectangle(cornerRadius: 9).fill(Color("prim")))
                                                    })
                                                    
                                                    Button(action: {
                                                        
                                                        viewModel.selectedHabit = index
                                                        
                                                        viewModel.hNewDays = String("\(0)")
                                                        
                                                        CoreDataStack.shared.updateHabit(withchName: viewModel.selectedHabit?.hName ?? "", hNewDays: viewModel.hNewDays)
                                                        
                                                        viewModel.fetchHabits()
                                                        
                                                        viewModel.dmph += 1
                                                        
                                                    }, label: {
                                                        
                                                        Text("Missed")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 15, weight: .regular))
                                                            .frame(width: 110, height: 50)
                                                            .background(RoundedRectangle(cornerRadius: 9).fill(Color.white.opacity(0.1)))
                                                    })
                                                }
                                                
                                            } else {
                                                
                                                VStack {
                                                    
                                                    Button(action: {
                                                        
                                                        viewModel.selectedHabit = index
                                                        
                                                        viewModel.hNewDays = String("\(Int((Int(viewModel.selectedHabit?.hDays ?? "") ?? 0) + 1))")
                                                        
                                                        CoreDataStack.shared.updateHabit(withchName: viewModel.selectedHabit?.hName ?? "", hNewDays: viewModel.hNewDays)
                                                        
                                                        viewModel.fetchHabits()
                                                        
                                                        viewModel.tdnh += 1
                                                        
                                                    }, label: {
                                                        
                                                        Text("Skipped")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 15, weight: .regular))
                                                            .frame(width: 110, height: 50)
                                                            .background(RoundedRectangle(cornerRadius: 9).fill(Color("prim2")))
                                                    })
                                                    
                                                    Button(action: {
                                                        
                                                        viewModel.selectedHabit = index
                                                        
                                                        viewModel.hNewDays = String("\(0)")
                                                        
                                                        CoreDataStack.shared.updateHabit(withchName: viewModel.selectedHabit?.hName ?? "", hNewDays: viewModel.hNewDays)
                                                        
                                                        viewModel.fetchHabits()
                                                        
                                                        viewModel.dmnh += 1
                                                        
                                                    }, label: {
                                                        
                                                        Text("Relapsed")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 15, weight: .regular))
                                                            .frame(width: 110, height: 50)
                                                            .background(RoundedRectangle(cornerRadius: 9).fill(Color.white.opacity(0.1)))
                                                    })
                                                }
                                            }
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.filterType == "Positive" ? Color("prim") : Color("prim2")))
                                    .padding(1)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchHabits()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddHab(viewModel: viewModel)
        })
    }
}

#Preview {
    HabitsView()
}
