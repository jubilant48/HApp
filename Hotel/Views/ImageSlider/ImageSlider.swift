//
//  ImageSlider.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI
import SFSafeSymbols
import CachedAsyncImage

struct ImageSlider: View {
    // MARK: - Attributes
    
    @State private var selectedTab = 0
    
    var imageUrls: [URL?]
    
    private let cornderRadius: CGFloat = 15
    private let errorColor = Color.red
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(0..<imageUrls.count) { index in
                CachedAsyncImage(url: imageUrls[index]) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .cornerRadius(cornderRadius)
                    case .failure(let error):
                        VStack {
                            Image(systemSymbol: .xCircle)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(errorColor)
                                .padding(.all, 16)
                            Text("Ошибка загрузки\n изображения")
                                .multilineTextAlignment(.center)
                                .foregroundColor(errorColor)
                                .onAppear {
                                    print(error.localizedDescription)
                                }
                        }
                        .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
        }

        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .overlay(
                FiveDotsIndexView(numberOfPages: imageUrls.count,
                                  selectedTab: selectedTab)
                .padding(.bottom, 12),
                alignment: .bottom
        )
        .animation(.default, value: UUID())
        .cornerRadius(cornderRadius)
        
    }
    
    
}

// MARK: - Preview

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider(imageUrls: [
            URL(string: "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Privé_by_Belek_Club_House.jpg"),
            URL(string: "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg"),
            URL(string: "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"),
            URL(string: "https://mmf5angy.twic.pics/ahstatic/www.ahstatic.com/photos/b1j0_roskdc_00_p_1024x768.jpg?ritok=65&twic=v1/cover=800x600"),
            URL(string: "https://www.google.com/search?q=номер+люкс+в+отели+египта+с+с%D0%BE%D0%B1с%D1%82в%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0сс%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&tbm=isch&ved=2ahUKEwilufKp-4KBAxUfJxAIHR4uAToQ2-cCegQIABAA&oq=номер+люкс+в+отели+египта+с+с%D0%BE%D0%B1с%D1%82в%D0%B5%D0%BD%D0%BD%D1%8B%D0%BC+%D0%B1%D0%B0сс%D0%B5%D0%B9%D0%BD%D0%BE%D0%BC&gs_lcp=CgNpbWcQAzoECCMQJ1CqAVi6HGDmHWgAcAB4AIABXIgB3wySAQIyNZgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=Y3fuZOX7KJ_OwPAPntyE0AM&bih=815&biw=1440#imgrc=Nr2wzh3vuY4jEM&imgdii=zTCXWbFgrQ5HBM"),
            URL(string: "https://tour-find.ru/thumb/2/bsb2EIEFA8nm22MvHqMLlw/r/d/screenshot_3_94.png"),
            URL(string: "https://www.atorus.ru/sites/default/files/upload/image/News/56871/риксос сигейт.jpg"),
            URL(string: "https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o="),
            URL(string: "https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg")
        ])
        
    }
}
