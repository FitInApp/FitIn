import Foundation
import ParseSwift

struct Workout: Identifiable {
    let id = UUID()
    let name: String
    let description: String

    static var data: [Workout] {
        [
            Workout(name: "Workout 1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus faucibus consequat ex, ut dignissim velit congue eget."),
            Workout(name: "Workout 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus faucibus consequat ex, ut dignissim velit congue eget."),
            Workout(name: "Workout 3", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus faucibus consequat ex, ut dignissim velit congue eget.")
        ]
    }
}

