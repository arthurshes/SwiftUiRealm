//
//  Task.swift
//  SwiftUiRealmChert
//
//  Created by Артур Шестаков on 13.04.2023.
//

import Foundation
import RealmSwift

class Task:Object,ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id:ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
