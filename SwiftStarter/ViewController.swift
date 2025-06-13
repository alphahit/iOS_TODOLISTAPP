//
//  ViewController.swift
//  SwiftStarter
//
//  Created by Prateek Priyadarshi on 09/06/25.
//

import UIKit

class ViewController: UIViewController {
    // Defines a new class named ViewController, which inherits from UIViewController.
    // UIViewController is the base class for managing a single screen of content in an iOS app.
    
    // Array to hold the list of tasks (Similar to React's useState)
    var tasks: [Task] = [] // Declares a mutable array named 'tasks' that will hold objects of type 'Task'.
    // It's initialized as an empty array. This will store the list of tasks for the app.
    let tableView = UITableView()// Declares a constant property named 'tableView' and initializes it as a new UITableView instance.
    // UITableView is a UI element used to display a list of scrollable data, typically rows of items.
    
    
    var modalView: UIView!
    var taskTextField: UITextField!
    
    
    override func viewDidLoad() {// This is a lifecycle method, called automatically after the view controller's view has been loaded into memory.
        // It's a common place to perform initial setup for the view.
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        setupTableView() // Calls a custom method to configure and set up the tableView.
        setupNavigationBar() // Calls a custom method to configure and set up the navigation bar.
    }
    
    // ---
    // Setup TableView
    // ---
    func setupTableView() { // Defines a custom method to encapsulate the setup logic for the UITableView.
        
        tableView.backgroundColor = .black
        tableView.dataSource = self // Sets the tableView's dataSource to 'self', meaning this ViewController will provide the data for the table.
        // This requires the ViewController to conform to the UITableViewDataSource protocol.
        tableView.delegate = self // Sets the tableView's delegate to 'self', meaning this ViewController will handle user interactions and events for the table.
        // This requires the ViewController to conform to the UITableViewDelegate protocol.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell") // Registers a standard UITableViewCell class for reuse with the identifier "Cell".
        // This is crucial for efficient table view performance, as cells are recycled.
        tableView.translatesAutoresizingMaskIntoConstraints = false // Disables the automatic generation of Auto Layout constraints from the view's autoresizing mask.
        // This allows you to define your own constraints programmatically.
        view.addSubview(tableView) // Adds the tableView as a subview to the view controller's main view.
        // This makes the tableView visible on the screen.
        
        NSLayoutConstraint.activate([ // Activates an array of Auto Layout constraints.
            tableView.topAnchor.constraint(equalTo: view.topAnchor), // Constrains the top edge of the tableView to the top edge of its superview (the main view).
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor), // Constrains the leading (left) edge of the tableView to the leading edge of its superview.
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor), // Constrains the trailing (right) edge of the tableView to the trailing edge of its superview.
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // Constrains the bottom edge of the tableView to the bottom edge of its superview.
                                    ]) // These four constraints make the tableView fill the entire area of the main view.
    }
    
    
    // Setup custom navigation bar button
    func setupNavigationBar() {
        // Create a custom button for navigation
        let addButton = UIButton(type: .system)
        addButton.setTitle("Add Task", for: .normal)
        addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        
        // Create a bar button item with the custom button
        let barButtonItem = UIBarButtonItem(customView: addButton)
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    
    @objc func addTapped() {
        // Show modal when the button is tapped
        showAddTaskModal()
    }
    
    // Show modal for task input
    func showAddTaskModal() {
        // Create modal view and add it to the view
        modalView = UIView()
        modalView.backgroundColor = .gray // Transparent black background
        modalView.layer.cornerRadius = 10
        modalView.translatesAutoresizingMaskIntoConstraints = false // Use Auto Layout
        view.addSubview(modalView)
        
        
        // Create a text field for task title
        taskTextField = UITextField()
        taskTextField.placeholder = "Enter Task"
        taskTextField.backgroundColor = .white
        taskTextField.layer.cornerRadius = 10
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        // Add padding to the left of the text field
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: taskTextField.frame.height))
        taskTextField.leftView = leftPaddingView
        taskTextField.leftViewMode = .always

        // Add padding to the right of the text field (optional)
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: taskTextField.frame.height))
        taskTextField.rightView = rightPaddingView
        taskTextField.rightViewMode = .always
        taskTextField.accessibilityLabel = "Task title input field"
        modalView.addSubview(taskTextField)
     
        
       
        
        // Create a save button to save the task
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.accessibilityLabel = "Save task button"
        // Set title color to white
        saveButton.setTitleColor(.white, for: .normal)
        
        // Set background color to blue
        saveButton.backgroundColor = .blue
        
        // Set corner radius for rounded corners
        saveButton.layer.cornerRadius = 10
        
        // Set border color and width if you want a border
        saveButton.layer.borderColor = UIColor.white.cgColor
        saveButton.layer.borderWidth = 1.0
        
        // Add padding for the button title
        saveButton.titleEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        // Set the button as a non-translatable view for Auto Layout
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the target for the button tap
        saveButton.addTarget(self, action: #selector(saveTask), for: .touchUpInside)
        
        modalView.addSubview(saveButton)
        
        // Create a cancel button to dismiss modal
        let cancelButton = UIButton(type: .system)
        cancelButton.accessibilityLabel = "Cancel button"
        cancelButton.setTitle("Cancel", for: .normal)
        // Set title color to white
        cancelButton.setTitleColor(.white, for: .normal)
        
        // Set background color to blue
        cancelButton.backgroundColor = .red
    
        // Set corner radius for rounded corners
        cancelButton.layer.cornerRadius = 10
        
        // Set border color and width if you want a border
        cancelButton.layer.borderColor = UIColor.white.cgColor
        cancelButton.layer.borderWidth = 1.0
        
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelModal), for: .touchUpInside)
        modalView.addSubview(cancelButton)
        
        // Layout constraints for modal and its subviews
        NSLayoutConstraint.activate([
            taskTextField.centerXAnchor.constraint(equalTo: modalView.centerXAnchor),
            taskTextField.centerYAnchor.constraint(equalTo: modalView.centerYAnchor, constant: -30),
            taskTextField.widthAnchor.constraint(equalToConstant: 250),
            // NEW: fix the height
            taskTextField.heightAnchor.constraint(equalToConstant: 40),
            saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: modalView.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 40), // Set height of the button
            saveButton.widthAnchor.constraint(equalToConstant: 200), // Set width of the button
            
            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10),
            cancelButton.centerXAnchor.constraint(equalTo: modalView.centerXAnchor),
            cancelButton.heightAnchor.constraint(equalToConstant: 40), // Set height of the button
            cancelButton.widthAnchor.constraint(equalToConstant: 200), // Set width of the button
            
            
            // Set the width to be 80% of the screen width
            modalView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            // Set the height to a constant value (e.g., 300)
            modalView.heightAnchor.constraint(equalToConstant: 300),
            
            // Center the modalView in the middle of the screen
            modalView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Set the vertical position (optional, but useful to avoid the modal going off-screen)
            modalView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    @objc func saveTask() {
        guard let title = taskTextField.text, !title.isEmpty else { return }
        
        // Add the task to the list
        let newTask = Task(title: title, isCompleted: false)
        tasks.append(newTask)
        
        // Insert new row in table view
        let indexPath = IndexPath(row: tasks.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        // Close modal
        cancelModal()
    }
    
    @objc func cancelModal() {
        modalView.removeFromSuperview() // Remove the modal view from the main view
    }
}

// ---
// MARK: - UITableViewDataSource, UITableViewDelegate
// ---
// This extension is a common Swift practice to separate the conformance to protocols
// from the main class definition, improving readability and organization.
extension ViewController: UITableViewDataSource, UITableViewDelegate { // Extends the ViewController class to conform to two protocols:
    // UITableViewDataSource: provides data to the table view (e.g., number of rows, cell content).
    // UITableViewDelegate: handles user interactions and appearance customization for the table view.
    
    // ---
    // Number of rows in the table
    // ---
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // A required method from UITableViewDataSource.
        // It asks the data source for the number of rows in a specified section of the table view.
        return tasks.count // Returns the number of elements in the 'tasks' array, determining how many rows will be displayed.
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        cell.accessoryType = task.isCompleted ? .checkmark : .none
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tasks[indexPath.row].isCompleted.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}

