import SwiftUI

struct ExerciseDetView: View {
    var exercise: Exercise

    // Add this function to handle the save button action
    func saveWorkout() {
        print("Workout saved")
    }

    var body: some View {
        VStack {
            Image(exercise.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .padding(.top, 50)

            Text(exercise.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text(exercise.description)
                .font(.body)
                .padding(.top, 20)
                .padding(.horizontal, 20)

            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: saveWorkout) {
                    Image(systemName: "square.and.arrow.down")
                        .font(.title)
                }
            }
        }
    }
}
