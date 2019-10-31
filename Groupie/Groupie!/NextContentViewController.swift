//
//  NextContentViewController.swift
//  Groupie!
//
//  Created by 沈昊诚 on 2018/11/30.
//  Copyright © 2018年 myl142857. All rights reserved.
//

import UIKit

protocol AddMemberDelegate: class{
    func addMember(member: Member)
}

class NextContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var memberTableView: UITableView!
    var members: [Member]!
    let memberReuseIdentifier = "memberReuseIdentifier"
    var inviteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let fakeMember1 = Member(name: "Richie Zhu")
        members = [fakeMember1]
        
        memberTableView = UITableView(frame: .zero)
        memberTableView.translatesAutoresizingMaskIntoConstraints = false
        memberTableView.delegate = self
        memberTableView.dataSource = self
        memberTableView.register(MemberTableViewCell.self, forCellReuseIdentifier: memberReuseIdentifier)
        view.addSubview(memberTableView)
        
        inviteButton = UIButton()
        inviteButton.translatesAutoresizingMaskIntoConstraints = false
        inviteButton.setTitle ("Invite", for: .normal)
        inviteButton.setTitleColor(.black, for: .normal)
        inviteButton.layer.borderWidth = 2.0
        inviteButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        inviteButton.addTarget(self, action: #selector(presentSearchViewController), for: .touchUpInside)
        view.addSubview(inviteButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inviteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            inviteButton.heightAnchor.constraint(equalToConstant: 30),
            inviteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inviteButton.widthAnchor.constraint(equalToConstant: 150)
            ])
        
        NSLayoutConstraint.activate([
            memberTableView.topAnchor.constraint(equalTo: inviteButton.bottomAnchor, constant: 10),
            memberTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            memberTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            memberTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: memberReuseIdentifier, for: indexPath) as! MemberTableViewCell
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
    
    @objc func presentSearchViewController(){
        let searchViewController = SearchViewController()
        searchViewController.delegate = self
        present(searchViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension NextContentViewController: AddMemberDelegate {
    func addMember(member: Member) {
        members.append(member)
        memberTableView.reloadData()
    }
}
