//
//  ViewController.swift
//  TableViewUsingProgramming
//
//  Created by Abhishek Kumar on 28/02/22.
//

import UIKit

class ViewController: UIViewController {

    
    override func loadView() {
        super.loadView()
        setupUI()
        setupConstraints()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    private let tableView: UITableView = {
        let someTableView = UITableView()
        someTableView.backgroundColor = .red
        someTableView.translatesAutoresizingMaskIntoConstraints = false
        return someTableView
    }()

    
    func setupUI() {
        view.addSubview(tableView)
    }

    func setupConstraints() {
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                                     tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
                                     tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                                     tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0)])
    }
}


extension ViewController: UITableViewDelegate {

    func go(to View: Int ) {
        print("go to index \(View)")
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        go(to: indexPath.row)
    }
}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        cell.textLabel?.font = .boldSystemFont(ofSize: 30)
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

}
