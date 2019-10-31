//
//  SearchViewController.swift
//  Groupie!
//
//  Created by 沈昊诚 on 2018/12/1.
//  Copyright © 2018年 myl142857. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var searchBar: UISearchBar!
    var resultTableView: UITableView!
    var resultList: [Member]!
    
    let resultReuseIdentifier = "resultCellReuse"
    
    weak var delegate: AddMemberDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let fakeMember = Member(name: "Dave Francis")
        let fakeMember2 = Member(name: "David Herrera")
        let fakeMember3 = Member(name: "Davide Alexander")
        let fakeMember4 = Member(name: "Davis Ball")
        resultList = [fakeMember,fakeMember2,fakeMember3,fakeMember4]
        
        searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        resultTableView = UITableView()
        resultTableView.translatesAutoresizingMaskIntoConstraints = false
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.register(ResultTableViewCell.self, forCellReuseIdentifier: resultReuseIdentifier)
        view.addSubview(resultTableView)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.widthAnchor.constraint(equalToConstant: 300)
            ])
        
        NSLayoutConstraint.activate([
            resultTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            resultTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            resultTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    @objc func getBack(){
        dismiss(animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Succeed!")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resultReuseIdentifier, for: indexPath) as! ResultTableViewCell
        let result = resultList[indexPath.row]
        cell.configure(for: result)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let actualMember = resultList[indexPath.row]
        delegate?.addMember(member: actualMember)
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
