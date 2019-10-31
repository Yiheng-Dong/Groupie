//
//  MFCMContentViewController.swift
//  Groupie!
//
//  Created by 沈昊诚 on 2018/12/2.
//  Copyright © 2018年 myl142857. All rights reserved.
//

import UIKit

class MFCMContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var memberTableView: UITableView!
    var members = [Member]([])
    let memberInGroupReuseIdentifier = "memberInGroupReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        UserNetworkManager.getUsers(completion: {(user) in
            for usersample in user {
                let realUser = Member(name: usersample.username)
                self.members.append(realUser)
                self.memberTableView.reloadData()
            }
        })
        
        memberTableView = UITableView(frame: .zero)
        memberTableView.translatesAutoresizingMaskIntoConstraints = false
        memberTableView.delegate = self
        memberTableView.dataSource = self
        memberTableView.register(MemberInGroupTableViewCell.self, forCellReuseIdentifier: memberInGroupReuseIdentifier)
        view.addSubview(memberTableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            memberTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            memberTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            memberTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            memberTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: memberInGroupReuseIdentifier, for: indexPath) as! MemberInGroupTableViewCell
        let member = members[indexPath.row]
        cell.configure(for: member)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
