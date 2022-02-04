//
//  spacexRepository.swift
//  technicalTest
//
//  Created by burak cakir on 3.02.2022.
//






import Foundation








class LatestManager : ObservableObject
{

    @Published var latests : [latestModel] = [latestModel]()
//    @Published var latest : latestModel = latestModel()
    
    func getAll() -> [latestModel]{
        
      
        
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches/latest") else{ return [latestModel]()}
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            
            do{
                if let latests = data{
               
                    let decodeData = try JSONDecoder().decode([latestModel].self , from: latests)
                    
                    self.latests = decodeData
                    
                    
                }
            }
            catch{
                print("Error")
            }
            
        }.resume()
        
        return  self.latests;
        
    }
    
    
//    func getOrderById(id:Int) -> latestModel{
//        guard let url = URL(string: "https://api.spacexdata.com/v4/launches" + String(id)) else{ return latestModel()}
//        
//        
//       
//            URLSession.shared.dataTask(with: url){(data, response, error) in
//            
//            do{
//                if let latest = data{
//               
//                    let decodeData = try JSONDecoder().decode(latestModel.self , from: latest)
//                    
//                    DispatchQueue.main.async {
//                    self.latest = decodeData
//                        
//                      }
//                  
//                    
//                }
//            }
//            catch{
//                print("Error")
//            }
//            
//        }.resume()
//        
//        return  self.latest;
//    }
    
}

