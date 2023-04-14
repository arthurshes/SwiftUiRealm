//
//  AddTaskView.swift
//  SwiftUiRealmChert
//
//  Created by Артур Шестаков on 13.04.2023.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager:RealmManager
    @State private var title:String = ""
    @Environment(\.dismiss) var dissmis
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            Text("Создать новую задачу")
                .font(.title3).bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            
            TextField("Введите задачу",text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button{
                if title != ""{
                    realmManager.addTask(taskTitle: title)
                }
                dissmis()
            }label: {
                Text("Добавить задачу")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.blue)
                    .cornerRadius(14)
            }
            Spacer()
        }
        .padding(.top,40)
        .padding(.horizontal)
        .background(Color(.green))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
