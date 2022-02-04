import SwiftUI
import URLImage

struct spacexLatestView: View {
    
  
    
    var Repo = GenericRepository<latestModel>()
    @State var list = [latestModel]()
    var body: some View {
       
        VStack{
         
            List(list, id:\.name){item in
                HStack{
                    
                    
     
                    VStack{
                        Text(String (item.flight_number) + "-"  + item.name )
                        Text(String(item.id))
                            .font(.callout)
                    }
                }
              
            }
            
        }
        
        .onAppear(){
            Repo.getAll(url: ""){ data in
                
                list = data;
                
            }
        }

                
        
    }
}

struct spacexLatestView_Previews: PreviewProvider {
    static var previews: some View {
        spacexLatestView()
    }
}




func getImage(product:latestModel) -> URL{
    
       return URL(string: product.links?.patch?.small ?? "  ")!
  
    
}
