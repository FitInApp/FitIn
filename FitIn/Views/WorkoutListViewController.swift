//
//  WorkoutListViewController.swift
//  FitIn
//
//  Created by Matias Fuenzalida on 4/3/23.
//
import SwiftUI
import Foundation
class WorkoutListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var workouts: [Workout] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        segmentedControl.addTarget(self, action: #selector(segmentedControlDidChange(_:)), for: .valueChanged)
        loadWorkouts(for: .arms)
    }
    
    func loadWorkouts(for bodyPart: BodyPart) {
        workouts = WorkoutData.workouts.filter { $0.bodyPart == bodyPart }
        tableView.reloadData()
    }
    
    @objc func segmentedControlDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            loadWorkouts(for: .arms)
        case 1:
            loadWorkouts(for: .legs)
        case 2:
            loadWorkouts(for: .chest)
        case 3:
            loadWorkouts(for: .back)
        case 4:
            loadWorkouts(for: .abs)
        default:
            break
        }
    }

}

extension WorkoutListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath)
        let workout = workouts[indexPath.row]
        cell.textLabel?.text = workout.name
        cell.detailTextLabel?.text = workout.description
        return cell
    }
}
