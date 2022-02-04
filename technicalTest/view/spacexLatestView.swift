import SwiftUI


struct spacexLatestView: View {
    
    @State var latest : latestModel = latestModel()
    
    
    
    var body: some View {
        VStack{
            Text( latest.id)
            Text ( latest.name)
            Text (latest.links.patch.small)
        }
        .onAppear(){
            guard let url = URL(string: "https://api.spacexdata.com/v4/launches/latest") else{ return}
            
            
           
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
            

        }
    

                
        
    }
}

struct spacexLatestView_Previews: PreviewProvider {
    static var previews: some View {
        spacexLatestView()
    }
}





