//
//  SceneDelegate.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 08/08/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let tabBarController: UITabBarController = UITabBarController()
        let eventLocationVC: EventLocationViewController = EventLocationViewController()
        let listEventsVC: ListEventsViewController = ListEventsViewController()
        listEventsVC.setup(viewModel: ListEventsViewModel(showOnlyFavorite: false))
        let newsVC: NewsViewController = NewsViewController()
        newsVC.setup(viewModel: NewsViewModel())
        let favoriteVC: FavoriteEventsViewController = FavoriteEventsViewController()
        favoriteVC.setup(viewModel: ListEventsViewModel(showOnlyFavorite: true))
        let profileVC: ProfileViewController = ProfileViewController()
        
        listEventsVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        newsVC.tabBarItem = UITabBarItem(title: "Notícias", image: UIImage(named: "newspaper"), tag: 1)
        eventLocationVC.tabBarItem = UITabBarItem(title: "Local", image: UIImage(named: "map"), tag: 2)
        favoriteVC.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "heart"), tag: 3)
        profileVC.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(named: "profile"), tag: 4)
//        tabBarController.setViewControllers([
//            UINavigationController(rootViewController: listEventsVC),
//            UINavigationController(rootViewController: newsVC),
//            eventLocationVC,
//            UINavigationController(rootViewController: favoriteVC),
//            profileVC
//        ], animated: false)
        tabBarController.setViewControllers([
            UINavigationController(rootViewController: listEventsVC),
            UINavigationController(rootViewController: favoriteVC),
            profileVC
        ], animated: false)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

