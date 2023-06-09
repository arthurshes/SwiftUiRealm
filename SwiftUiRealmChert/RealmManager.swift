//
//  RealmManager.swift
//  SwiftUiRealmChert
//
//  Created by Артур Шестаков on 13.04.2023.
//

import Foundation
import RealmSwift
class RealmManager:ObservableObject{
    private(set) var localRealm:Realm?
    @Published private(set) var tasks:[Task] = []
    init(){
        openRealm()
        getTasks()
    }
    
    func addTask(taskTitle:String){
        if let localRealm = localRealm{
            do{
                try localRealm.write{
                    let newTask = Task(value: ["title":taskTitle,"completed":false])
                    localRealm.add(newTask)
                    getTasks()
                    print("Success saved \(newTask)")
                }
            }catch{
                print("local realm add error \(error)")
            }
        }
    }
    
    
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        }catch{
            print("error realm \(error)")
        }
    }
    
    func getTasks(){
        if let localRealm = localRealm{
           let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id:ObjectId,completed:Bool){
        if let localRealm = localRealm{
            do{
               let taskUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@",id))
                guard !taskUpdate.isEmpty else {
                    return
                }
                try localRealm.write{
                    taskUpdate[0].completed = completed
                    getTasks()
                    print("Success update ")
                }
            }catch{
                print("error update task \(id) to Realm")
            }
        }
    }
    func deleteTasl(id:ObjectId){
        if let localRealm = localRealm{
            do{
                let taskDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@",id))
                guard !taskDelete.isEmpty else {
                    return
                }
                try localRealm.write{
                    localRealm.delete(taskDelete)
                    getTasks()
                    print("Succes deleted")
                }
            }catch{
                print("error \(id) to delete Realm")
            }
        }
    }
}
