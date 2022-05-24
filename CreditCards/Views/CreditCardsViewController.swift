//
//  CreditCardsViewController.swift
//  CreditCards
//
//  Created by Pedro Brojato on 02/05/22.
//

import UIKit

class CreditCardsViewController: UIViewController {
    
    let cards = [
        CreditCard(holderName: "Pedro Brojato", cardNumber: "111222333444", flag: "elo"),
        CreditCard(holderName: "Dafle Cardoso", cardNumber: "222333444555", flag: "mastercard"),
    ]
    
    let identifier = "CardCell"
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        let nib = UINib(nibName: identifier, bundle: nil)
        tv.separatorStyle = .none
        tv.register(nib, forCellReuseIdentifier: identifier)
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cartões"
        setup()
        setupNavigation()
    }
    
    func setupNavigation() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToNewCard))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func goToNewCard() {
        let newCard = NewCardViewController(nibName: nil, bundle: nil)
        navigationController?.pushViewController(newCard, animated: true)
    }
    
    func goToDetails() {
        let details = DetailsViewController(nibName: nil, bundle: nil)
        navigationController?.pushViewController(details, animated: true)
    }
    
    func setup() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            view.topAnchor.constraint(equalTo: tableView.topAnchor),
            view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])
    }
}

extension CreditCardsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetails()
        tableView.deselectRow(at: indexPath, animated: true)
     }
}

extension CreditCardsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CardCell
        let card = cards[indexPath.row]
        cell.setup(card: card)
        return cell
    }
}
