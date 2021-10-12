//
//  ListEventsViewController.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 09/08/21.
//

import UIKit

class ListEventsViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    private var viewModel: ListEventsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.dataSource = self
        tableView.delegate = self
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
        tableView.register(ListHeaderCellView.nib, forCellReuseIdentifier: ListHeaderCellView.identifier)
        tableView.register(ListFilterCell.nib, forCellReuseIdentifier: ListFilterCell.identifier)
        tableView.register(EventCell.nib, forCellReuseIdentifier: EventCell.identifier)
        let appearence: UINavigationBarAppearance = UINavigationBarAppearance()
        appearence.configureWithOpaqueBackground()
        appearence.backgroundColor = UIColor.ANIME.customRed
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        navigationController?.navigationBar.barTintColor = UIColor.ANIME.customRed
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        let tabBarAppearence: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearence.configureWithOpaqueBackground()
        tabBarAppearence.backgroundColor = UIColor.ANIME.customRed
        
        let tabBarItemAppearence: UITabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearence.normal.iconColor = .systemGray4
        tabBarItemAppearence.selected.iconColor = .white
        tabBarItemAppearence.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGray3]
        
        tabBarAppearence.inlineLayoutAppearance = tabBarItemAppearence
        tabBarAppearence.compactInlineLayoutAppearance = tabBarItemAppearence
        tabBarAppearence.stackedLayoutAppearance = tabBarItemAppearence
        
        tabBarController?.tabBar.standardAppearance = tabBarAppearence
//        tabBarController?.tabBarItem.standardAppearance = tabBarAppearence
        if #available(iOS 15.0, *) {
            tabBarController?.tabBar.scrollEdgeAppearance = tabBarAppearence
//            tabBarController?.tabBarItem. = tabBarAppearence
        }
        
        tabBarController?.tabBar.isTranslucent = false
        tabBarController?.tabBar.barTintColor = UIColor.ANIME.customRed
        tabBarController?.tabBar.tintColor = .white
        tabBarController?.tabBar.unselectedItemTintColor = .systemGray4
        title = "Home"
    }
}

extension ListEventsViewController: UITableViewDataSource {
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
            cell.delegate = self
            return cell
        default:
            guard let cell: EventCell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier) as? EventCell,
                  let event: Event = viewModel?.eventList[indexPath.row - (viewModel?.uniqueCellsCount ?? 0)] else { return UITableViewCell() }
            cell.setupEvent(event: event)
            return cell
        }
    }
}

extension ListEventsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 127
        case 1:
            return 100
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

extension ListEventsViewController: SearchDelegate {
    func textDidChange(newText: String) {
        viewModel?.textSearched = newText
        tableView.reloadData()
    }
}



