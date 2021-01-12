//
//  Todo.swift
//  TodoList
//
//  Created by joonwon lee on 2020/03/19.
//  Copyright © 2020 com.joonwon. All rights reserved.
//  Modified by Noah on 2021/01/12.
//

import UIKit


// TODO: Codable과 Equatable 추가
struct Todo: Codable, Equatable {
    let id: Int
    var isDone: Bool
    var detail: String
    var isToday: Bool

    mutating func update(isDone: Bool, detail: String, isToday: Bool) {
        // update 로직
        self.isDone = isDone
        self.detail = detail
        self.isToday = isToday
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        // 동등 조건 추가
        return lhs.id == rhs.id
    }
}

class TodoManager {

    static let shared = TodoManager()

    static var lastId: Int = 0

    var todos: [Todo] = []

    func createTodo(detail: String, isToday: Bool) -> Todo {
        // create로직
        let nextId = TodoManager.lastId + 1
        TodoManager.lastId = nextId
        return Todo(id: nextId, isDone: false, detail: detail, isToday: isToday)
    }

    func addTodo(_ todo: Todo) {
        // add로직
        todos.append(todo)
        saveTodo()
    }

    func deleteTodo(_ todo: Todo) {
        // delete 로직
        todos = todos.filter { $0.id != todo.id }
        saveTodo()
    }

    func updateTodo(_ todo: Todo) {
        // update 로직
        guard let index = todos.firstIndex(of: todo) else { return }
        todos[index].update(isDone: todo.isDone, detail: todo.detail, isToday: todo.isToday)
        saveTodo()
    }

    func saveTodo() {
        Storage.store(todos, to: .documents, as: "todos.json")
    }

    func retrieveTodo() {
        todos = Storage.retrive("todos.json", from: .documents, as: [Todo].self) ?? []

        let lastId = todos.last?.id ?? 0
        TodoManager.lastId = lastId
    }
}

class TodoViewModel {

    enum Section: Int, CaseIterable {
        case today
        case upcoming

        var title: String {
            switch self {
            case .today: return "Today"
            default: return "Upcoming"
            }
        }
    }

    private let manager = TodoManager.shared

    var todos: [Todo] {
        return manager.todos
    }

    var todayTodos: [Todo] {
        return todos.filter { $0.isToday == true }
    }

    var upcompingTodos: [Todo] {
        return todos.filter { $0.isToday == false }
    }

    var numOfSection: Int {
        return Section.allCases.count
    }

    func addTodo(_ todo: Todo) {
        manager.addTodo(todo)
    }

    func deleteTodo(_ todo: Todo) {
        manager.deleteTodo(todo)
    }

    func updateTodo(_ todo: Todo) {
        manager.updateTodo(todo)
    }

    func loadTasks() {
        manager.retrieveTodo()
    }
}

