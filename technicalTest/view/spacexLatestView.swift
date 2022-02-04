import SwiftUI
import URLImage

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
                
                URLImage( getImage(myimage: latest) ){ image in
                    image.resizable()
                    
                }
               
            }
            .padding()
            
          Spacer()
            
            Text (latest.details  ?? "Detail Not Found")
            
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




func getImage(myimage : latestModel) -> URL{
    if(myimage.links.patch.small.count > 0){
       return URL(string: myimage.links.patch.small)!
  
    }
    else{
        return URL(string: "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg")!
      
    }
}

