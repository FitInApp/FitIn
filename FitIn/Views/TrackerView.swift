//
//  TrackerView.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//

import SwiftUI
import Charts
struct WeatherData: Identifiable {
    let id = UUID()
    let date: Date
    let temperature: Double
 
    init(year: Int, month: Int, day: Int, temperature: Double) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.temperature = temperature
    }
}
let chartData = [
                  (city: "London", data: londonWeatherData)
                  ]
let londonWeatherData = [ WeatherData(year: 2021, month: 7, day: 1, temperature: 19.0),
                          WeatherData(year: 2021, month: 8, day: 1, temperature: 17.0),
                          WeatherData(year: 2021, month: 9, day: 1, temperature: 17.0),
                          WeatherData(year: 2021, month: 10, day: 1, temperature: 13.0),
                          WeatherData(year: 2021, month: 11, day: 1, temperature: 8.0),
                          WeatherData(year: 2021, month: 12, day: 1, temperature: 8.0),
                          WeatherData(year: 2022, month: 1, day: 1, temperature: 5.0),
                          WeatherData(year: 2022, month: 2, day: 1, temperature: 8.0),
                          WeatherData(year: 2022, month: 3, day: 1, temperature: 9.0),
                          WeatherData(year: 2022, month: 4, day: 1, temperature: 11.0),
                          WeatherData(year: 2022, month: 5, day: 1, temperature: 15.0),
                          WeatherData(year: 2022, month: 6, day: 1, temperature: 18.0)
]


struct TrackerView: View {
    
    @State private var path = NavigationPath()
    @State private var showingAddModal = false
    
    let pageName = "Tracker"
   
    


    var body: some View {
        //TODO: Add userprofile / preferences.
        VStack(alignment:.leading,spacing:20){
            HStack{
                Text(pageName.uppercased())
                    .font(.custom("AllertaStencil-Regular", size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button("+ Log"){
                    onAddButtonTapped()
                }.sheet(isPresented: $showingAddModal) {
                    AddLogModal().foregroundColor(.black).presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
                .font(.subheadline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .foregroundColor(Color(.systemBackground))
                        .background(Color(.label))
                        .cornerRadius(8)
            }.padding([.leading,.trailing], 16)
            
   
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    Text("Weight").font(.title2)
                    Chart {
                                    ForEach(londonWeatherData) { item in
                                        LineMark(
                                            x: .value("Month", item.date),
                                            y: .value("Temp", item.temperature)
                                        )
                                    }
                                }
                    .frame(height: 200).foregroundColor(.red)
                }.padding(20)
                
                ScrollView(.horizontal){
                    HStack{
                        VStack{
                        Text("sidfu")
                        }.frame(width: 250,height: 125).background(.black).clipShape(RoundedRectangle(cornerRadius: 12))
                        VStack{
                        Text("sidfu")
                        }.frame(width: 250,height: 125).background(.black).clipShape(RoundedRectangle(cornerRadius: 12))
                    }.padding(.horizontal)
                }.scrollIndicators(.hidden)

                Divider().padding(16)

                VStack(alignment: .leading){
                    Text("My Posts").font(.title2)
                    //TODO: Add user's personal posts here similar to homescreen.
                }
                
            }
           
        }
        
    }
    
    
    func onAddButtonTapped () {
        showingAddModal.toggle()
    }
    func addWorkout () {
        //TODO: implement add workout using Exercise object and add to a new object that holds historical information
    }
}

struct AddWorkoutView: View {
    var body: some View{
        VStack{
            
        }
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}



