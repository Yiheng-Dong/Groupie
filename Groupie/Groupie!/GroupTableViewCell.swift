//
//  GroupTableViewCell.swift
//  Groupie!
//
//  Created by myl142857 on 11/30/18.
//  Copyright © 2018 myl142857. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var courseLabel: UILabel!
    var memberLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        contentView.addSubview(nameLabel)
        
        courseLabel = UILabel()
        courseLabel.translatesAutoresizingMaskIntoConstraints = false
        courseLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        contentView.addSubview(courseLabel)
        
        memberLabel = UILabel()
        memberLabel.translatesAutoresizingMaskIntoConstraints = false
        memberLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        memberLabel.textAlignment = .right
        contentView.addSubview(memberLabel)
        
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            courseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            courseLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            courseLabel.widthAnchor.constraint(equalToConstant: 200),
            courseLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        NSLayoutConstraint.activate([
            memberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            memberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            memberLabel.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        super.updateConstraints()
    }
    
    func configure(for group: Group) {
        nameLabel.text = group.name
        courseLabel.text = group.course
        memberLabel.text = group.member
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
