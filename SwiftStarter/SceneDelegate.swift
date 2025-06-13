import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Step 1: Cast the incoming scene to UIWindowScene. This is where we will create our window and attach it to the primary view controller.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Step 2: Create a new UIWindow using the windowScene
        let window = UIWindow(windowScene: windowScene)
        
        // Step 3: Instantiate your initial ViewController
        let vc = ViewController()  // Ensure ViewController is your actual root view controller class
        
        // Step 4: Wrap in a navigation controller
        let navController = UINavigationController(rootViewController: vc)
        
        // Step 5: Assign and show the view controller
        window.rootViewController = navController
        window.makeKeyAndVisible() // Make the window visible
        
        // Assign the window instance to the property
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Handle scene disconnection, usually no action needed.
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Handle when the app becomes active.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Handle when the app is about to become inactive.
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Handle when the app enters the foreground.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Handle when the app enters the background.
    }
}
