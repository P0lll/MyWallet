//
//  SecondViewController.swift
//  MyWallet
//
//  Created by Pavel Bukatin on 09.10.2023.
//

import SnapKit
import UIKit


class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        
        ApiManager.shared.getCoinPrice { [weak self] values in
            DispatchQueue.main.async {
                guard let self else { return }
                self.data = values
                self.tableView.reloadData()
            }
        }
    }
    // MARK: Private properties
    private var tableView = UITableView()
    private var data: [Datum] = []
}
// MARK: - UITableViewDataSource
extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let data = data[indexPath.row]
        cell.textLabel?.text = "\(data.name) - \(data.priceUsd) USD \(data.priceBtc)"
        
        return cell
    }
}
        



