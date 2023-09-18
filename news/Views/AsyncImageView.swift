import SwiftUI

struct AsyncImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    private var src: String
    
    init(src: String) {
        self.src = src
    }
    
    var body: some View {
        Group {
            if let imageURL = URL(string: src) {
                if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    ProgressView() // or a placeholder image
                }
            } else {
                Text("Invalid URL")
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            if let imageURL = URL(string: src) {
                imageLoader.loadImage(from: imageURL)
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        // Initialize AsyncImageView with a URL as a string
        AsyncImageView(src: "https://www.copahost.com/blog/wp-content/uploads/2019/07/imgsize2.png")
    }
}
