//
//  ContentView.swift
//  DemoInstagram
//
//  Created by Bao Vu on 7/14/20.
//  Copyright © 2020 Bao Vu. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

struct ContentView: View {
    var body: some View {
        
        TabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// This is a TabView....

struct TabView: View{
    
    @State var index = 0
    
    var body: some View{
        
        VStack{
            
            ZStack{
                
                Home().opacity(self.index == 0 ? 1:0)
                Upload().opacity(self.index == 2 ? 1:0)
            }
            
            
            HStack{
                
                // This is a Home button...
                Button(action: {
                    self.index = 0
                }) {
                    Image("home")
                        .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(self.index == 0 ? .blue : .black)
                        
                    
                }
                
                Spacer(minLength: 0)
                
                // This is a Search button...
                Button(action: {
                    self.index = 1
                }) {
                    Image("search")
                        .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(self.index == 1 ? .blue : .black)
                }
                
                Spacer(minLength: 0)
                
                // This is a Upload button...
                Button(action: {
                    self.index = 2
                }) {
                    Image("plus")
                        .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(self.index == 2 ? .blue : .black)
                }
                
                Spacer(minLength: 0)
                
                // This is a like button...
                Button(action: {
                    self.index = 3
                }) {
                    Image("heart")
                        .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(self.index == 3 ? .blue : .black)
                }
                
                Spacer(minLength: 0)
                
                // This is a Profile button...
                Button(action: {
                    self.index = 4
                }) {
                    Image("person")
                        .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(self.index == 4 ? .blue : .black)
                    
                }
            }.padding(.vertical, 10)
                .padding(.horizontal)
        }
    }
}

// This is a Home View....

struct Home: View {
    
    @ObservedObject var observed = observer()
    
    var body: some View{
        
        VStack{

            ZStack{

                HStack{

                    // This is a Taking Photo button..

                    Button(action: {

                    }) {
                        Image("camera")
                        .resizable()
                        .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }

                    Spacer()

                    // This is a Send button..

                    Button(action: {

                    }) {
                        Image("email")
                        .resizable()
                        .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }

                }.padding()

                Text("Instagram")
                    .font(.title)
                    .fontWeight(.bold)
            }

            Divider()
            
            // Middle View....
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 10){
                            
                            Button(action: {
                                
                            }) {
                                
                                VStack{
                                    ZStack{
                                        Image("mb5")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                            .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [.red,.orange]), startPoint: .bottom, endPoint: .top), lineWidth: 3))
                                        
                                        Image("plus")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                            .foregroundColor(.white)
                                            .background(Color.blue)
                                            .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                            .offset(x: 20, y: 20)
                                    }
                        
                                    Text("Your Story")
                                        .foregroundColor(.black)
                                }
                                
                                
                            }
                            ForEach(observed.status){i in
                                
                                VStack{
                                    StatusCard(imgName: i.image,name: i.name)
                                    
                                }
                            }
                        }.padding()
                    }
                    
                    Divider()
                    
                    ForEach(observed.status){i in
                        
                        postCard(user: i.name, image: i.image, id: i.id)
                        
                        Divider()
                        
                    }
                }
            }
        
        }
    }
}

// This is a StatusCard...

struct StatusCard : View {
    
    var imgName = ""
    var name = ""
    
    var body: some View {
        
        Button(action: {
            
        }) {
            VStack{
                RemoteImage(url: imgName, placeholder: Image(systemName: "photo"))
                
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                    .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [.red,.orange]), startPoint: .bottom, endPoint: .top), lineWidth: 3))
                Text("\(name)")
                    .font(.footnote)
            }
            
        }.padding()
    }
}

// This is a postCart...

struct postCard : View{
    
    var user = ""
    var image = ""
    var id = ""
    
    var body : some View{
        
        VStack{
            
            HStack{
                
                Button(action: {
                    
                }) {
                 //   HStack(spacing: 10){
                        RemoteImage(url: image, placeholder:Image(systemName: "photo"))
                        
                        .frame(width: 35, height: 35)
                            .clipShape(Circle())
                        
                        Text("\(user)")
                            .font(.footnote)
                 //   }
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("menu")
                    .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
                
            }.padding()
            
            Image("baovu").resizable().frame(height: 300)
            
            HStack{
                
                Button(action: {
                    
                }) {
                    Image("heart")
                    .resizable()
                    .frame(width: 30, height: 30)
                    
                }
                
                
                
                Button(action: {
                    
                }) {
                    Image("comment")
                    .resizable()
                    .frame(width: 30, height: 30)
                    
                }
                
                
                
                Button(action: {
                    
                }) {
                    Image("email")
                    .resizable()
                    .frame(width: 30, height: 30)
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("save")
                    .resizable()
                    .frame(width: 30, height: 30)
                    
                }
                
            }.padding()
            
        }
        
    }
}


// This is a class to get data from Firebase...

class observer : ObservableObject{
    
    @Published var status = [datatype]()
    
    init(){
        
        let db = Firestore.firestore()
        db.collection("status").addSnapshotListener { (snap, error) in
            
            if error != nil {
                print("Error")
                return
            }
            
            for i in snap!.documentChanges{
                
                if i.type == .added{
                    
                    let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let image = i.document.get("image") as! String
                    
                    DispatchQueue.main.async {
                        self.status.append(datatype(id: id, name: name, image: image))
                    }
                }
            }
        }
    }
}

// This is a struct of data.....

struct datatype: Identifiable {
    
    var id : String
    var name: String
    var image: String
    
}

// This is a class to load Images from the Internet by using URL....

class ImageLoader: ObservableObject{
    
    @Published var downloadImage: UIImage?
    
    func fetchImage(url: String){
        
        guard let imageURL = URL(string: url) else{
            
            fatalError("The url string is invalid")
        }
        URLSession.shared.dataTask(with: imageURL) { (data, response, err) in
            guard let data = data , err == nil else{
                fatalError("Error data")
            }
            DispatchQueue.main.async {
                self.downloadImage = UIImage(data: data)
            }
        }.resume()
    }
}

// This is a struct of remoteImage...

struct RemoteImage: View{
    
    @ObservedObject var imageLoader = ImageLoader()
    var placeholder: Image
    
    init(url:String, placeholder: Image = Image(systemName: "photo")){
        self.placeholder = placeholder
        self.imageLoader.fetchImage(url: url)
    }
    
    var body: some View{
        
        if let image = self.imageLoader.downloadImage{
            return Image(uiImage: image).resizable()
        }
        return placeholder
    }
}

//This is a struct of Upload photos....

struct Upload: View {
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var image: UIImage?
    var body: some View{
        
        VStack{
            
            ZStack{
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        Text("Cancel")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("Next")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }.padding()
                HStack{
                    Text("Recents")
                    .foregroundColor(.gray)
                    .font(.title)
                    Button(action: {
                        self.showSheet = true
                    }) {
                        Image(systemName: "arrow.down")
                    }
                }
                
            }
            Divider()
            Spacer()
            
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [.default(Text("Photo Library"), action: {
                        self.showImagePicker = true
                        self.sourceType = .photoLibrary
                    }),
                                                                                                .default(Text("Camera"), action: {
                                                                                                    self.showImagePicker = true
                                                                                                    self.sourceType = .camera                                         }),
                                                                                                .cancel()
                    ])
            }
        }.sheet(isPresented: $showImagePicker) {
            Text("MODAL")
        }
    }
}

// This is a struct to create ImagePicker View...

struct ImagePicker: UIViewControllerRepresentable{
    
    typealias Coordinator = ImagePickerCoordinator
    
    @Binding var image: UIImage?
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePickerCoordinator(image: $image)
    }
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @Binding var image: UIImage?
    
    init(image: Binding<UIImage?>) {
        _image = image
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       if  let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            image = uiImage
        }
    }
}
