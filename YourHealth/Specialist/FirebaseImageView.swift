//
//  FirebaseImageView.swift
//  YourHealth
//
//  Created by conteangelo on 15/01/2021.
//

import SwiftUI
import Combine
import FirebaseStorage

struct FirebaseImageView: View {
    
    @ObservedObject var imageLoader: DataLoader
    @State var image: UIImage = UIImage()
    
    init(imageLoader: String) {
        imageLoader = DataLoader(urlString: imageUrl)
    }
    
    var body: some View {
        
        VStack{
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400, height: 400)
        }.onReceive(imageLoader.didChange) { data in
        self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

class DataLoader: ObservableObject {
    @Published var didChange = PassthroughSebject<Data, Never>()
    @Published var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(urlString: String) {
        getDataFromUrl(urlString: urlString)
    }
    
    func getDataFromUrl(urlString: urlString){
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}

struct FirebaseImageView_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseImageView(imageLoader: imageLoader)
    }
}
