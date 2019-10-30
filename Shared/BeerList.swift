//
//  BeerList.swift
//  IntentKit
//
//  Created by Siddhant Mishra on 19/10/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import UIKit

public class BeerList: UIView {

    private let contentView = UIView()
       private let cardView = UIView()
       private let stackView = UIStackView()
       private let amountView = UIView()
       private let amountLabel = UILabel()
       private let amountValueLabel = UILabel()
       private let dueView = UIView()
       private let dueLabel = UILabel()
       private let dueValueLabel = UILabel()
       
       public override init(frame: CGRect) {
           super.init(frame: frame)
           setUpSubViews()
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("not implemented")
       }
       
   }

   private extension BeerList {
    
       func setUpSubViews() {
           contentView.backgroundColor = UIColor(red:  129/255, green: 159/255, blue: 247/255, alpha: 1)
           addSubview(contentView)
           
           cardView.backgroundColor = UIColor.white
           cardView.layer.cornerRadius = 4
           
           cardView.layer.masksToBounds = false
           cardView.layer.shadowColor = UIColor.black.cgColor
           cardView.layer.shadowOffset = CGSize(width: 0, height: 3)
           cardView.layer.shadowRadius = 3
           cardView.layer.shadowOpacity = 0.12
           contentView.addSubview(cardView)
           
           stackView.axis = .vertical
           stackView.distribution = .fill
           stackView.alignment = .fill
           stackView.spacing = 0
           cardView.addSubview(stackView)
           
           amountLabel.text = "Amount Due"
           amountLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
           amountLabel.textColor = UIColor(red:  69/255, green: 80/255, blue: 81/255, alpha: 1)
           amountView.addSubview(amountLabel)
           
           amountValueLabel.text = "$34.56"
           amountValueLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
           amountValueLabel.textColor = UIColor(red:  32/255, green: 32/255, blue: 32/255, alpha: 1)
           amountValueLabel.textAlignment = .right
           amountView.addSubview(amountValueLabel)
           
           amountLabel.translatesAutoresizingMaskIntoConstraints = false
           amountValueLabel.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               amountLabel.leadingAnchor.constraint(equalTo: amountView.leadingAnchor),
               amountValueLabel.leadingAnchor.constraint(equalTo: amountLabel.trailingAnchor),
               amountLabel.topAnchor.constraint(equalTo: amountView.topAnchor, constant: 8),
               amountView.bottomAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 8),
               
               amountView.trailingAnchor.constraint(equalTo: amountValueLabel.trailingAnchor),
               amountValueLabel.topAnchor.constraint(equalTo: amountView.topAnchor, constant: 8),
               amountView.bottomAnchor.constraint(equalTo: amountValueLabel.bottomAnchor, constant: 8),
               ])
           stackView.addArrangedSubview(amountView)
           
           dueLabel.text = "Due Date"
           dueLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
           dueLabel.textColor = UIColor(red:  69/255, green: 80/255, blue: 81/255, alpha: 1)
           dueView.addSubview(dueLabel)
           
           dueValueLabel.text = "Jun 09, 2019"
           dueValueLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
           dueValueLabel.textColor = UIColor(red:  32/255, green: 32/255, blue: 32/255, alpha: 1)
           dueValueLabel.textAlignment = .right
           dueView.addSubview(dueValueLabel)
           dueLabel.translatesAutoresizingMaskIntoConstraints = false
           dueValueLabel.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               dueLabel.leadingAnchor.constraint(equalTo: dueView.leadingAnchor),
               dueValueLabel.leadingAnchor.constraint(equalTo: dueLabel.trailingAnchor),
               dueLabel.topAnchor.constraint(equalTo: dueView.topAnchor, constant: 8),
               dueView.bottomAnchor.constraint(equalTo: dueLabel.bottomAnchor, constant: 8),
               
               dueView.trailingAnchor.constraint(equalTo: dueValueLabel.trailingAnchor),
               dueValueLabel.topAnchor.constraint(equalTo: dueView.topAnchor, constant: 8),
               dueView.bottomAnchor.constraint(equalTo: dueValueLabel.bottomAnchor, constant: 8),
               ])
           stackView.addArrangedSubview(dueView)
           
           
           addConstraints()
       }
       
       func addConstraints() {
           contentView.translatesAutoresizingMaskIntoConstraints = false
           cardView.translatesAutoresizingMaskIntoConstraints = false
           stackView.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
               trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               contentView.topAnchor.constraint(equalTo: topAnchor),
               bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
               
               cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
               contentView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 8),
               cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
               contentView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 8),
               
               stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
               cardView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 16),
               stackView.topAnchor.constraint(equalTo: cardView.topAnchor),
               cardView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
               
               ])
       }
}
