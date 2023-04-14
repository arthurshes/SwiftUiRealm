//
//  ContentView.swift
//  SwiftUiRealmChert
//
//  Created by Артур Шестаков on 13.04.2023.
//

import SwiftUI
import RealmSwift
struct TasksView: View {
    @EnvironmentObject var realmManager:RealmManager
    var body: some View {
        VStack {
       Text("Мои задачи")
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            List{
                ForEach(realmManager.tasks,id:\.id){
                    task in
                    if !task.isInvalidated{
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role:.destructive){
                                    realmManager.deleteTasl(id: task.id)
                                }label: {
                                    Label("Удалить",systemImage: "trash")
                                }
                            }
                    }
                   
                }
            }.onAppear{
                UITableView.appearance().backgroundColor
                = UIColor.clear
                UITableViewCell.appearance()
                    .backgroundColor = UIColor.clear
            }
   
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(.green))
        
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
