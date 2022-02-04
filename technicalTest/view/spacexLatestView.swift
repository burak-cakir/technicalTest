import SwiftUI


struct spacexLatestView: View {
    
    @State var latest : latestModel = latestModel()
    
    
    
    var body: some View {
        VStack{
            Text("Spacexdata Latest").underline()
                .font(.largeTitle)
                .foregroundColor(Color.red)
                .padding(0)
            HStack{
                Spacer()
                Text("Spacex id :")
                    .font(.headline)
                Text (latest.id)
                    .font(.headline)
                Spacer()
            }.padding(5)
                .background(Color.red)
                .foregroundColor(Color.white)
                .cornerRadius(5)
            VStack{
                Text("Spacex Name :")
                    .font(.headline)
                HStack{
                    Spacer()
                    Text (latest.name)
                        .font(.title)
                        .bold()
                    Spacer()
                }
                
             
            }
            .foregroundColor(Color.white)
            .padding(5)
            .background(Color.blue)
            .cornerRadius(5)
            HStack{
                
                Text (latest.links.patch.small)
            }
            .padding()
            
          Spacer()
            
            
           
            
            
            
//            Text (String (latest.flight_number))
//           Text (latest.details).lineLimit(1)
            
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





