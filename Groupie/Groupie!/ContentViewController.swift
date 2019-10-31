//
//  ContentViewController.swift
//  Groupie!
//
//  Created by myl142857 on 11/26/18.
//  Copyright © 2018 myl142857. All rights reserved.
//

import UIKit
import EzPopup

class ContentViewController: UIViewController {

    var groupName: UILabel!
    var groupNameTF: UITextField!
    var inviteMemberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        groupName = UILabel()
        groupName.translatesAutoresizingMaskIntoConstraints = false
        groupName.text = "Group name: "
        groupName.textColor = UIColor(displayP3Red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        groupName.font = .systemFont(ofSize: 20, weight: .medium)
        view.addSubview(groupName)
        
        groupNameTF = UITextField()
        groupNameTF.translatesAutoresizingMaskIntoConstraints = false
        groupNameTF.backgroundColor = .lightGray
        groupNameTF.text = ""
        groupNameTF.textAlignment = .center
        view.addSubview(groupNameTF)
        
        inviteMemberButton = UIButton()
        inviteMemberButton.translatesAutoresizingMaskIntoConstraints = false
        inviteMemberButton.setTitle ("Next!", for: .normal)
        inviteMemberButton.setTitleColor(.black, for: .normal)
        inviteMemberButton.layer.borderWidth = 2.0
        inviteMemberButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        inviteMemberButton.addTarget(self, action: #selector(inviteMember), for: .touchUpInside)
        view.addSubview(inviteMemberButton)
        
        setupConstraints()
    }

    func setupConstraints(){
        NSLayoutConstraint.activate([
            groupName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            groupName.heightAnchor.constraint(equalToConstant: 30),
            groupName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            groupName.widthAnchor.constraint(equalToConstant: 120)
            ])
        
        NSLayoutConstraint.activate([
            groupNameTF.topAnchor.constraint(equalTo: groupName.topAnchor),
            groupNameTF.leadingAnchor.constraint(equalTo: groupName.trailingAnchor),
            groupNameTF.widthAnchor.constraint(equalToConstant: 200),
            groupNameTF.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            inviteMemberButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            inviteMemberButton.heightAnchor.constraint(equalToConstant: 30),
            inviteMemberButton.widthAnchor.constraint(equalToConstant: 150),
            inviteMemberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    @objc func inviteMember(){
        
        var contentVC: NextContentViewController!
        var popUpVC: PopupViewController!
        
        contentVC = NextContentViewController()
        
        popUpVC = PopupViewController(contentController: contentVC, popupWidth: 400, popupHeight: 600)
        
        present(popUpVC, animated: true)
        
        popUpVC.backgroundAlpha = 0.3
        popUpVC.backgroundColor = .black
        popUpVC.canTapOutsideToDismiss = true
        popUpVC.cornerRadius = 10
        popUpVC.shadowEnabled = true
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
