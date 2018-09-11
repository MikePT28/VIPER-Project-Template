//
//  DashboardView.swift
//  VIPER
//
//  Created by Mike Pesate on 06/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import UIKit

final class DashboardView: BaseView {

    var presenter: DashboardPresenterProtocol!

    fileprivate var name: UILabel!
    fileprivate var lastName: UILabel!
    fileprivate var card: CardView!
    fileprivate var vStackView: UIStackView!
    fileprivate var logoutButton: UIButton!
    
    private enum ViewTraits {
        static let marging: CGFloat = 24.0
        static let innerCardPadding: CGFloat = 8.0
        static let verticalSpacing: CGFloat = 4.0
        static let dividerHeight: CGFloat = 1.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadData()
    }
    
    override func setupComponents() {
        view.backgroundColor = .vPurple
        
        name = .subtitle
        lastName = .header
        
        vStackView = UIStackView(arrangedSubviews: [name, lastName])
        vStackView.axis = .vertical
        vStackView.alignment = .center
        vStackView.distribution = .fillEqually
        vStackView.spacing = ViewTraits.verticalSpacing
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        card = CardView()
        card.backgroundColor = .white
        card.translatesAutoresizingMaskIntoConstraints = false
        
        logoutButton = UIButton(type: .system)
        logoutButton.setTitle("Log Out", for: .normal)
        logoutButton.titleLabel?.font = .buttonTitle
        logoutButton.addTarget(self, action: #selector(logoutAction(_:)), for: .touchUpInside)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        card.addSubview(vStackView)
        view.addSubview(card)
        view.addSubview(logoutButton)
        
    }
    
    override func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            vStackView.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: ViewTraits.innerCardPadding),
            vStackView.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -ViewTraits.innerCardPadding),
            vStackView.topAnchor.constraint(equalTo: card.topAnchor, constant: ViewTraits.innerCardPadding),
            vStackView.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -ViewTraits.innerCardPadding),
            
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ViewTraits.marging),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -ViewTraits.marging),
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.topAnchor.constraint(equalTo: card.bottomAnchor, constant: ViewTraits.verticalSpacing)
            
            ])
        
    }
    
    @objc fileprivate func logoutAction(_ sender: Any?) {
        presenter.performLogout()
    }
    
}

extension DashboardView: DashboardViewProtocol {
    
    func show(viewModel: Dashboard.ViewModel) {
        name.text = viewModel.name
        lastName.text = viewModel.lastName
    }
    
}
