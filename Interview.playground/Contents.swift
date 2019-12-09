//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class ImageStore {
    static let shared = ImageStore()
    
    func getImage(_ name: String) -> UIImage {
        return fetchImage(name)
    }
    
    private func fetchImage(_ name: String) -> UIImage {
        Thread.sleep(forTimeInterval: 5.0)
        return UIImage()
    }
}

class MyViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let images = loadImages()
        showImages(images)
        print ("loading")
    }
    
    func loadImages() -> [UIImage] {
        let image1 = ImageStore.shared.getImage("boy")
        let image2 = ImageStore.shared.getImage("meets")
        let image3 = ImageStore.shared.getImage("world")
        return [image1, image2, image3]
    }
    
    func showImages(_ images: [UIImage]) {
        // implementation detail
        print(images)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()




// 1. ImageStore.image()  is slowwwwww. Update the function from sync to async so we do not block the main thread.
// 2. ImageStore.image()  fetches a new image each request. Update ImageLoader to cache the images.
// 3. Update loadImages()  declaration to provide a progress update. 1/3 for each image.
// 4. How can we update loadImages() to load images concurrently?
// 5. How can we ensure ImageLoader class is threadsafe?
