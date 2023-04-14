//
//  TrackerView.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//

import SwiftUI
import Charts
import ParseSwift

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
    @State private var showingPhotosModal = false
    @State private var userPosts: [Post]? = User.current?.posts
    @State private var userWeightHistory: [WeightLog] = User.current?.weightHistory ?? []
    
    
    let pageName = "Tracker"
    var weightLogChartDataArray: [WeightLogChartData] = []
    
  
    var body: some View {
        let weightLogChartDataArray = userWeightHistory.map { getWeightLogChartDataPoint(weightLog: $0) }
                
        let maxValue = weightLogChartDataArray.map { $0.weight }.max() ?? 0
        let minValue = weightLogChartDataArray.map { $0.weight }.min() ?? 0
             
        
        VStack(alignment:.leading,spacing:20){
            HStack{
                Text(pageName.uppercased())
                    .font(.custom("AllertaStencil-Regular", size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button("+ Daily Log"){
                    onAddButtonTapped()
                }.sheet(isPresented: $showingAddModal) {
                    AddLogModal(userWeightLog: $userWeightHistory).foregroundColor(.black).presentationDetents([.fraction(0.75)])
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
                    
                    if(!weightLogChartDataArray.isEmpty){
                        Text("Weight").font(.title2)
                        
                        Chart {
                            ForEach(weightLogChartDataArray) { item in
                                LineMark(
                                    x: .value("Date", item.date),
                                    y: .value("Weight", item.weight)
                                )
                            }
                        }
                        .frame(height: 200).foregroundColor(.red)
                    }else{
                        Chart{
                            
                        }.frame(height: 200).foregroundColor(.red)
                    }
                    
                }.padding(.horizontal, 20)
                Spacer().frame(height: 16)
           
                ScrollView(.horizontal){
                    HStack{
                        Button {
                            showingPhotosModal.toggle()
                        } label: {
                            Label("Progress Photos", systemImage: "photo")
                        }.sheet(isPresented: $showingPhotosModal) {
                            ProgressGallery()
                        }

                       
                    }.frame(width: 360,height: 80).background(.pink.opacity(0.1)).clipShape(RoundedRectangle(cornerRadius: 12)).padding(16).foregroundColor(.black)
                }.scrollIndicators(.hidden)

                Divider().padding(16)

                VStack(alignment: .leading){
                    Text("My Posts").font(.title2)
                    VStack(spacing: 20) {
                        if(userPosts == nil){
                            Text("No posts to display").frame(height: 50).foregroundColor(.gray).padding(.top, 50)
                            Button("+ Post"){
                                onAddButtonTapped()
                            }.sheet(isPresented: $showingAddModal) {
                                AddPostModal().foregroundColor(.black).presentationDetents([.fraction(0.75)])
                                    .presentationDragIndicator(.visible)
                            }
                            .font(.subheadline)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .foregroundColor(Color(.systemBackground))
                                    .background(Color(.label))
                                    .cornerRadius(8)
                        }else{
                            ForEach(userPosts ?? [] , id: \.objectId) { item in
                                PostCard(userId: item.user!, text: item.weight!,image: item.imageID!, date: item.createdAt!, weight:item.weight!, calories: item.calories!)
                            }
                        }
                    }.frame(width: 350).edgesIgnoringSafeArea(.horizontal)
                    
                }.frame(width: 350).edgesIgnoringSafeArea(.horizontal)
                
            }
           
        }
        
    }
    
    
    func onAddButtonTapped () {
        showingAddModal.toggle()
    }
    func getWeightLogChartDataPoint (weightLog: WeightLog) -> WeightLogChartData {
        guard let date = weightLog.createdAt, let weight = weightLog.weight else {
               print("Error: createdAt or weight is nil")
            return WeightLogChartData(date: Date.now, weight: 0)
           }
           return WeightLogChartData(date: date, weight: weight)
    }
   
}

struct WeightLogChartData :Identifiable{
    let id = UUID()
    let date: Date
    let weight: Int
}



struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}



