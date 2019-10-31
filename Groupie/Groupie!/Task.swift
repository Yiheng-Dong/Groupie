//
//  Task.swift
//  Groupie!
//
//  Created by myl142857 on 11/28/18.
//  Copyright © 2018 myl142857. All rights reserved.
//

import Foundation

class Task {
    
    var name: String
    var course: String
    var member: String
    var deadline: String
    var isCompleted: Bool
    
    init(name: String, course: String, member: String, deadline: String, isCompleted: Bool) {
        self.name = name
        self.course = course
        self.member = member
        self.deadline = deadline
        self.isCompleted = isCompleted
    }
}
