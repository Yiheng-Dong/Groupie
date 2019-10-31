//
//  InsideGroupViewController.swift
//  Groupie!
//
//  Created by 沈昊诚 on 2018/11/30.
//  Copyright © 2018年 myl142857. All rights reserved.
//

import UIKit
import EzPopup

class InsideGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var presentTasks: UITableView!
    var pastTasks: UITableView!
    var presentTasksList = [Task]([])
    var pastTasksList = [Task]([])
    var backBarButton: UIBarButtonItem!
    var addBarButton: UIBarButtonItem!
    
    let presentTasksReuseIdentifier = "presentTasksCellReuse"
    let pastTasksReuseIdentifier = "pastTasksCellReuse"
    let presentHeaderReuseIdentifier = "presentHeaderReuseIdentifier"
    let pastHeaderReuseIdentifier = "pastHeaderReuseIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let fakeTask = Task(name: "AppDev Final Project", course: "CS 1998", member: "Richie", deadline: "12/2", isCompleted: false)
        presentTasksList = [fakeTask]
        UserNetworkManager.getTasks2(completion: {(task) in
            for tasksample in task {
                let realTask = Task(name: tasksample.taskname, course: "CS 1998", member: "Richie, Sally", deadline: "12/2", isCompleted: tasksample.completed)
                self.pastTasksList.append(realTask)
                self.pastTasks.reloadData()
            }
        })
        
        presentTasks = UITableView()
        presentTasks.translatesAutoresizingMaskIntoConstraints = false
        presentTasks.delegate = self
        presentTasks.dataSource = self
        presentTasks.register(PresentTasksTableViewCell.self, forCellReuseIdentifier: presentTasksReuseIdentifier)
        view.addSubview(presentTasks)
        
        pastTasks = UITableView()
        pastTasks.translatesAutoresizingMaskIntoConstraints = false
        pastTasks.delegate = self
        pastTasks.dataSource = self
        pastTasks.register(PastTasksTableViewCell.self, forCellReuseIdentifier: pastTasksReuseIdentifier)
        view.addSubview(pastTasks)
        
        backBarButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(getBack(_:)))
        self.navigationItem.leftBarButtonItem = backBarButton
        
        addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(multipleFunctions))
        self.navigationItem.rightBarButtonItem = addBarButton
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            presentTasks.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            presentTasks.heightAnchor.constraint(equalToConstant: 350),
            presentTasks.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            presentTasks.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            pastTasks.topAnchor.constraint(equalTo: presentTasks.bottomAnchor, constant: 10),
            pastTasks.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pastTasks.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pastTasks.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.presentTasks {
            let cell = tableView.dequeueReusableCell(withIdentifier: presentTasksReuseIdentifier, for: indexPath) as! PresentTasksTableViewCell
            let presentTask = presentTasksList[indexPath.row]
            cell.configure(for: presentTask)
            cell.setNeedsUpdateConstraints()
            cell.selectionStyle = .none
            
            return cell
        }
        if tableView == self.pastTasks {
            let cell = tableView.dequeueReusableCell(withIdentifier: pastTasksReuseIdentifier, for: indexPath) as! PastTasksTableViewCell
            let pastTask = pastTasksList[indexPath.row]
            cell.configure(for: pastTask)
            cell.setNeedsUpdateConstraints()
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.presentTasks {
            return presentTasksList.count
        }
        if tableView == self.pastTasks {
            return pastTasksList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == self.presentTasks {
            return "Present Tasks"
        }
        if tableView == self.pastTasks {
            return "Past Tasks"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if tableView == self.presentTasks {
            let deleteButton = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexpath) in
                self.presentTasksList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            deleteButton.backgroundColor = .red
            let completeButton = UITableViewRowAction(style: .normal, title: "Mark As Completed") { (rowAction, indexpath) in
                self.presentTasksList[indexPath.row].isCompleted = true
                tableView.reloadData()
            }
            completeButton.backgroundColor = UIColor(displayP3Red: 50/255, green: 205/255, blue: 50/255, alpha: 1)
            
            return [deleteButton, completeButton]
        }
        
        if tableView == self.pastTasks {
            let deleteButton = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexpath) in
                self.pastTasksList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            deleteButton.backgroundColor = .red
            
            return [deleteButton]
        }
        
        return nil
    }
    
    @objc func getBack(_ sender:UIBarButtonItem!)
    {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func multipleFunctions() {
        var multipleFunctionsVC: MultipleFunctionsViewController!
        var popUpVC: PopupViewController!
        
        multipleFunctionsVC = MultipleFunctionsViewController()
        
        popUpVC = PopupViewController(contentController: multipleFunctionsVC, position: .topRight(CGPoint(x: 16, y: 88)), popupWidth: 200, popupHeight: 80)
        
        present(popUpVC, animated: true)

        popUpVC.backgroundAlpha = 0.3
        popUpVC.backgroundColor = .black
        popUpVC.canTapOutsideToDismiss = true
        popUpVC.cornerRadius = 10
        popUpVC.shadowEnabled = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
