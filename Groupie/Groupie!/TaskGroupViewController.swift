//
//  TaskViewController.swift
//  Groupie!
//
//  Created by myl142857 on 11/28/18.
//  Copyright © 2018 myl142857. All rights reserved.
//

import UIKit
import EzPopup

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var taskTableView: UITableView!
    var groupTableView: UITableView!
    var taskGroupSegmented: UISegmentedControl!
    var tasks = [Task]([])
    var groups = [Group]([])
    
    let taskReuseIdentifier = "taskCellReuse"
    let groupReuseIdentifier = "groupReuseIdentifier"
    
    var addBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Groupie!"
        view.backgroundColor = .white
        
        UserNetworkManager.getTasks(completion: {(task) in
            for tasksample in task {
                let realTask = Task(name: tasksample.taskname, course: "CS 1998", member: "Richie, Sally", deadline: "12/2", isCompleted: tasksample.completed)
                self.tasks.append(realTask)
                self.taskTableView.reloadData()
            }
        })
        
        UserNetworkManager.getGroups(completion: {(group) in
            for groupsample in group {
                let realGroup = Group(name: groupsample.groupname, course: "CS 1998", member: "Richie")
                self.groups.append(realGroup)
                self.groupTableView.reloadData()
            }
        })
        
        taskGroupSegmented = UISegmentedControl(items: ["Your Tasks","Groups"])
        taskGroupSegmented.translatesAutoresizingMaskIntoConstraints = false
        taskGroupSegmented.selectedSegmentIndex = 0
        taskGroupSegmented.addTarget(self, action: #selector(segmentedControlAction), for: .valueChanged)
        view.addSubview(taskGroupSegmented)
        
        groupTableView = UITableView(frame: .zero)
        groupTableView.translatesAutoresizingMaskIntoConstraints = false
        groupTableView.delegate = self
        groupTableView.dataSource = self
        groupTableView.register(GroupTableViewCell.self, forCellReuseIdentifier: groupReuseIdentifier)
        view.addSubview(groupTableView)
        
        taskTableView = UITableView(frame: .zero)
        taskTableView.translatesAutoresizingMaskIntoConstraints = false
        taskTableView.delegate = self
        taskTableView.dataSource = self
        taskTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: taskReuseIdentifier)
        view.addSubview(taskTableView)
        
        addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAGroup))
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            taskTableView.topAnchor.constraint(equalTo: taskGroupSegmented.bottomAnchor, constant: 10),
            taskTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            taskTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            groupTableView.topAnchor.constraint(equalTo: taskGroupSegmented.bottomAnchor, constant: 10),
            groupTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            groupTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            groupTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            taskGroupSegmented.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            taskGroupSegmented.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskGroupSegmented.widthAnchor.constraint(equalToConstant: 200),
            taskGroupSegmented.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.taskTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: taskReuseIdentifier, for: indexPath) as! TaskTableViewCell
            let task = tasks[indexPath.row]
            cell.configure(for: task)
            cell.setNeedsUpdateConstraints()
            cell.selectionStyle = .none
            
            return cell
        }
        if tableView == self.groupTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: groupReuseIdentifier, for: indexPath) as! GroupTableViewCell
            let group = groups[indexPath.row]
            cell.configure(for: group)
            cell.setNeedsUpdateConstraints()
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.taskTableView {
            return tasks.count
        }
        if tableView == self.groupTableView {
            return groups.count
        }
        return 0
    }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.groupTableView {
            let insideGroupViewController = InsideGroupViewController()
            navigationController?.pushViewController(insideGroupViewController, animated: true)
        }
    }
    
    func tableView( _tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if tableView == self.taskTableView {
            let deleteButton = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexpath) in
                self.tasks.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            deleteButton.backgroundColor = .red
            let completeButton = UITableViewRowAction(style: .normal, title: "Mark As Completed") { (rowAction, indexpath) in
                self.tasks[indexPath.row].isCompleted = true
                tableView.reloadData()
            }
            completeButton.backgroundColor = UIColor(displayP3Red: 50/255, green: 205/255, blue: 50/255, alpha: 1)
            
            return [deleteButton, completeButton]
        }
        
        if tableView == self.groupTableView {
            let deleteButton = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexpath) in
                self.groups.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            deleteButton.backgroundColor = .red
            
            return [deleteButton]
        }
        
        return nil
    }
    
    @objc func addAGroup(){
        
        var contentVC: ContentViewController!
        var popUpVC: PopupViewController!

        contentVC = ContentViewController()

        popUpVC = PopupViewController(contentController: contentVC, popupWidth: 400, popupHeight: 600)

        present(popUpVC, animated: true)

        popUpVC.backgroundAlpha = 0.3
        popUpVC.backgroundColor = .black
        popUpVC.canTapOutsideToDismiss = true
        popUpVC.cornerRadius = 10
        popUpVC.shadowEnabled = true
    }
    
    @IBAction func segmentedControlAction(sender: AnyObject) {
        if (taskGroupSegmented.selectedSegmentIndex == 0) {
            taskTableView.isHidden = false
            groupTableView.isHidden = true
            self.navigationItem.rightBarButtonItem = nil
        }
        else if (taskGroupSegmented.selectedSegmentIndex == 1) {
            taskTableView.isHidden = true
            groupTableView.isHidden = false
            self.navigationItem.rightBarButtonItem = addBarButton
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
