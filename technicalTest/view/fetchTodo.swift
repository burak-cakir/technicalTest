//
//  fetchTodo.swift
//  technicalTest
//
//  Created by burak cakir on 4.02.2022.
//

import SwiftUI
import Foundation



struct fetchTodo: View {
    
    @ObservedObject var fetch = FetchLatest()
    
    
    
    var body: some View {
       
        NavigationView{
            
            List(fetch.getData()){ todo in

                NavigationLink(
                
                    destination: ToDoPage(id: todo.id),
                    label: {
                        Text(todo.name)
                    }
                )
                .navigationTitle("ToDo List")
                .navigationBarTitleDisplayMode(.inline)
            
            }
            Text("asdas")
        }
    }


struct ToDoPage : View{

    var id:Int

    var body: some View{
        Text(String(id))
    }

}

struct fetchTodo_Previews: PreviewProvider {
    static var previews: some View {
        fetchTodo()
    }
}



class FetchLatest: ObservableObject{
    
    @Published var latests = [LatestModel]()
    @Published var latest = LatestModel(id: 0, name: "", flight_number: 0)
    
    
    func getData() -> [LatestModel] {
        let url = URL(string: "https://api.spacexdata.com/v4/launches")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            do {
                if let latestData = data {
                    let decodedData = try JSONDecoder().decode([LatestModel].self, from: latestData)

                    //DispatchQueue.main.async {
                    self.latests = decodedData
                    //}
                    
                }
                else{
                    print("No data!")
                }
                
//                guard let todoData = data else{
//                    print("No data!")
//                    return
//                }
//
//                                    let decodedData = try JSONDecoder().decode([ToDo].self, from: todoData)
//
//                                    DispatchQueue.main.async {
//                                        self.todos = decodedData
//                                    }
            }
            catch{
                print("Error!")
            }
        }.resume()
        
        return self.latests
    }
    
    
  
    
    
    init() {
        
        func getData() -> [LatestModel] {
            let url = URL(string: "https://api.spacexdata.com/v4/launches")!
            
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                
                do {
                    if let latestsData = data {
                        let decodedData = try JSONDecoder().decode([LatestModel].self, from: latestsData)

                        //DispatchQueue.main.async {
                            self.latests = decodedData
                        //}
                        
                    }
                    else{
                        print("No data!")
                    }
                    
    //                guard let todoData = data else{
    //                    print("No data!")
    //                    return
    //                }
    //
    //                                    let decodedData = try JSONDecoder().decode([ToDo].self, from: todoData)
    //
    //                                    DispatchQueue.main.async {
    //                                        self.todos = decodedData
    //                                    }
                }
                catch{
                    print("Error!")
                }
            }.resume()
            
            return self.latests
        }
    
    }
    
    
    
    
}

struct ToDo: Codable, Identifiable {
    
    public var id: Int
    public var title: String
    public var completed: Bool
    
}
    
    struct LatestModel : Codable ,Identifiable  {
        public var id: Int
        public var name : String
        public var  flight_number : Int
    }

}

