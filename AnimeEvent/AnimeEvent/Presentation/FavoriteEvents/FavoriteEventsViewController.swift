//
//  FavoriteEventsViewController.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 15/08/21.
//

import UIKit

class FavoriteEventsViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    private var viewModel: ListEventsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
        tableView.reloadData()
    }
    
    func setup(viewModel: ListEventsViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.ANIME.customRed
        tableView.backgroundColor = UIColor.ANIME.customRed
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListHeaderCellView.nib, forCellReuseIdentifier: ListHeaderCellView.identifier)
        tableView.register(ListFilterCell.nib, forCellReuseIdentifier: ListFilterCell.identifier)
        tableView.register(EventCell.nib, forCellReuseIdentifier: EventCell.identifier)
        navigationController?.navigationBar.barTintColor = UIColor.ANIME.customRed
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isTranslucent = false
        tabBarController?.tabBar.barTintColor = UIColor.ANIME.customRed
        tabBarController?.tabBar.tintColor = .white
        tabBarController?.tabBar.unselectedItemTintColor = .systemGray4
        title = "Favoritos"
    }
}

extension FavoriteEventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell: ListHeaderCellView = tableView.dequeueReusableCell(withIdentifier: ListHeaderCellView.identifier) as? ListHeaderCellView else { return UITableViewCell() }
            return cell

        case 1:
            guard let cell: ListFilterCell = tableView.dequeueReusableCell(withIdentifier: ListFilterCell.identifier) as? ListFilterCell else { return UITableViewCell() }
            cell.simpleCell(title: "Favoritos")
            return cell
        default:
            guard let cell: EventCell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier) as? EventCell,
                  let event: Event = viewModel?.eventList[indexPath.row - (viewModel?.uniqueCellsCount ?? 0)] else { return UITableViewCell() }
            cell.setupEvent(event: event)
            return cell
        }
    }
}

extension FavoriteEventsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 127
        case 1:
            return 60
        default:
            return 160
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 1,
           let selectedEvent: Event = viewModel?.eventList[indexPath.row - (viewModel?.uniqueCellsCount ?? 0)] {
            let eventDetailsVC: EventDetailsViewController = EventDetailsViewController()
            eventDetailsVC.setup(viewModel: EventDetailsViewModel(event: selectedEvent))
            show(eventDetailsVC, sender: nil)
        }
    }
}
