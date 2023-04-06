//
//  PostComponent.swift
//  FitIn
//
//  Created by Malcolm Verdier on 4/3/23.
//

import Foundation
import SwiftUI
import ParseSwift

struct UserPost: View{
    var userId:  User
    var text : String
    var image: URL
    var date : Date
    var weight: String
    var calories: String
    func getUserName() -> String {
            let constraint: QueryConstraint = "objectId" == userId.objectId!
            let query = try? User.query(constraint).find()
            
        return query![0].username!
    }
    func formatDate(updatedAt: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let date = formatter.string(from: updatedAt)
        return date
    }
    var body: some View {
        VStack{
            AsyncImage(url: image){ image in
                image
                    .resizable()      // Error here
            } placeholder: {
                ProgressView()//put your placeholder here
            }.frame(height: 200)
            HStack{
                VStack{
                    Text(getUserName())
                        .font(.system(.largeTitle, design: .rounded)).padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
                    HStack{
                        Text("Date:")
                        Text(formatDate(updatedAt: self.date))
                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 5)).frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        Text("Weight:")
                        Text(self.weight)
                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 5)).frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        Text("Calories:")
                           
                        Text(self.calories)
                          
                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 5)).frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)).frame(maxWidth: .infinity, alignment: .center)
                VStack{
                    Text("Top Workouts")
                        .font(.system(.headline, design: .rounded)).padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 20))
                    
                    HStack{
                        Text("Some Text")
                            .font(.system(.headline, design: .rounded)).foregroundColor(Color.white).padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    }.frame(maxWidth: .infinity, maxHeight: 30, alignment: .center).background(Color.black).cornerRadius(15).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    HStack{
                        Text("Some Text")
                            .font(.system(.headline, design: .rounded)).foregroundColor(Color.white).padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    }.frame(maxWidth: .infinity, maxHeight: 30, alignment: .center).background(Color.black).cornerRadius(15).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }.frame(maxWidth: .infinity).frame(alignment: .center)

        }.frame(maxWidth: .infinity, maxHeight: 500).background(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.1)).cornerRadius(15).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
