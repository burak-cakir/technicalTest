
import Foundation


class LatestManager : ObservableObject
{

    @Published var latests : [latestModel] = [latestModel]()
    @Published var latest : latestModel = latestModel()
    
   
    
    
    func getLatestRocket() -> latestModel{
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches/latest") else{ return latestModel()}
        
        
       
            URLSession.shared.dataTask(with: url){(data, response, error) in
            
            do{
                if let latest = data{
               
                    let decodeData = try JSONDecoder().decode(latestModel.self , from: latest)
                    
                    DispatchQueue.main.async {
                    self.latest = decodeData
                        
                      }
                  
                    
                }
            }
            catch{
                print("Error")
            }
            
        }.resume()
        
        return  self.latest;
    }
    
}

