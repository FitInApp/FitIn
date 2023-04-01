import SwiftUI

struct WorkoutListView: View {
    var workouts: [Workout]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(workouts) { workout in
                    NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                        HStack {
                            Text(workout.name)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .padding()
                        }
                        .frame(height: 60)
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Workouts")
    }
}

struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        let workouts = [            Workout(name: "Workout 1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus faucibus consequat ex, ut dignissim velit congue eget."),            Workout(name: "Workout 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus faucibus consequat ex, ut dignissim velit congue eget."),            Workout(name: "Workout 3", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus faucibus consequat ex, ut dignissim velit congue eget.")        ]
        WorkoutListView(workouts: workouts)
    }
}
