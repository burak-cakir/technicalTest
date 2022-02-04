import SwiftUI
import URLImage

struct spacexLatestView: View {
    
    @State var latest : latestModel = latestModel()
    @State var multiColor = true
    
    
    
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
                Text("Spacex Name ")
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
            VStack{
                HStack{
                    Text("Flight Number : ")
                    Text(String (latest.flight_number))
                    Text("Success : " + String (latest.success ? "OK" : "NOT"))
                }
                Text("Launcpad : " + latest.launchpad )
               
            }
            
            
            HStack{
                
                URLImage( getImage(myimage: latest) ){ image in
                    image.resizable()
                    
                }
               
            }
            .padding()
            
          Spacer()
            
            Text("   Spacex      Detail    ")
                .background(.brown)
                .foregroundColor(.white)
                .cornerRadius(5)
                .font(.headline)
                 
                .padding(0)
            VStack(spacing: 25){
                
                
                
                TextShimmer(text: latest.details  ?? "   Detail Not Found   ", multiColors: $multiColor)
                
         
                
               
            }
            
            
            
            
            
            
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


struct TextShimmer: View {
    
    var text: String
    @State var animation = false
    @Binding var multiColors: Bool
    
    var body: some View{
        
        ZStack{
             
            Text(text)
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(Color.white.opacity(0.5))
                .background(.pink)
                .cornerRadius(5)
            // MultiColor Text....
            
            HStack(spacing: 0){
                
                ForEach(0..<text.count,id: \.self){index in
                    
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(multiColors ? randomColor() : Color.white)
                        .background(.pink)
                        .cornerRadius(5)
                }
            }
            // Masking For Shimmer Effect...
            .mask(
            
                Rectangle()
                    // For Some More Nice Effect Were Going to use Gradient...
                    .fill(
                    
                        // You can use any Color Here...
                        LinearGradient(gradient: .init(colors: [Color.white.opacity(0.1),Color.white,Color.white.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: 170))
                    .padding(20)
                // Moving View Continously...
                // so it will create Shimmer Effect...
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
            )
            .onAppear(perform: {
            
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    
                    animation.toggle()
                }
            })
            
        }
       
    }
    
    // Random Color....
    
    // It's Your Wish yOu can change anything here...
    // or you can also use Array of colors to pick random One....
    
    func randomColor()->Color{
        
        let color = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        
        return Color(color)
    }
}
