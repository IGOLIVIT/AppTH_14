//
//  HabitsViewModel.swift
//  AppTH_14
//
//  Created by IGOR on 16/01/2025.
//

import SwiftUI
import CoreData

final class HabitsViewModel: ObservableObject {
    
    @Published var pp: String = String(format: "%.1f", Double(.random(in: 1...99)))
    @Published var np: String = String(format: "%.1f", Double(.random(in: 1...99)))
    
    @AppStorage("ph") var ph: Int = 0
    @AppStorage("nh") var nh: Int = 0
    @AppStorage("tdph") var tdph: Int = 0
    @AppStorage("tdnh") var tdnh: Int = 0
    @AppStorage("dmph") var dmph: Int = 0
    @AppStorage("dmnh") var dmnh: Int = 0

    @Published var types: [String] = ["Positive", "Negative"]
    @Published var curType = "Positive"
    @Published var filterType = "Positive"
    
    @Published var plus: Int = 0
    
    @Published var genders: [String] = ["Male", "Female"]
    @Published var selGen = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isReset: Bool = false

    @Published var hName: String = ""
    @Published var hType: String = ""
    @Published var hGoal: String = ""
    @Published var hDays: String = ""
    @Published var hNewDays: String = ""

    @Published var habits: [HabitModel] = []
    @Published var selectedHabit: HabitModel?

    func addHabit() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "HabitModel", into: context) as! HabitModel

        loan.hName = hName
        loan.hType = hType
        loan.hGoal = hGoal
        loan.hDays = hDays
        loan.hNewDays = hNewDays

        CoreDataStack.shared.saveContext()
    }

    func fetchHabits() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HabitModel>(entityName: "HabitModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.habits = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.habits = []
        }
    }
 
}
