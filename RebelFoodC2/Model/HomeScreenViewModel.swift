//
//  HomeScreenViewModel.swift
//  RebelFoodC2
//
//  Created by Ghouse Basha Shaik on 19/07/19.
//

import Foundation


class HomeScreenViewModel {
    
    func fetchTopMusicListDetails(successHandler: @escaping ([Result]?) -> Void) {
        fetch(topList: TopList.music, successHandler: { (musicList) in
            successHandler(musicList.feed?.results)
        }) { (failureString) in
            print("Music List Failed to load " + failureString)
        }
    }
    
    func fetchTopMoviesListDetails(successHandler: @escaping ([Result]?) -> Void)  {
        fetch(topList: TopList.movies, successHandler: { (moviesList) in
            successHandler(moviesList.feed?.results)
        }) { (failureString) in
            print("Movie List Failed to load " + failureString)
        }
    }
    
    func fetchTopTVShowsListDetails(successHandler: @escaping ([Result]?) -> Void)  {
        fetch(topList: TopList.tvshow, successHandler: { (tvShowList) in
            successHandler(tvShowList.feed?.results)
        }) { (failureString) in
            print("TV Show List Failed to load " + failureString)
        }
    }
    
    func fetchTopBooksListDetails(successHandler: @escaping ([Result]?) -> Void)  {
        fetch(topList: TopList.books, successHandler: { (booksList) in
            successHandler(booksList.feed?.results)
        }) { (failureString) in
            print("Booking List Failed to load " + failureString)
        }
    }
    
    func fetch(topList: TopList, successHandler:@escaping (FeedManagerService) -> Void, failureHandler:@escaping (String) -> Void)  {
        let apiRequest = APIRequest()
        apiRequest.urlString = topList.rawValue
        NewtworkManager.shared.makeAPICalls(apiRequest: apiRequest) { (data, response, error) in
            if let response = response {
                guard error == nil else {
                    failureHandler("Network Issue.")
                    return
                }
                if response.getStatusCode()! == 400 {
                    failureHandler("400 Error")
                }else {
                    do{
                        let topListResult = try FeedManagerService.init(data: data!)
                        successHandler(topListResult)
                    } catch {
                        failureHandler("Network failed. Check Parsing")
                    }
                }
            }else {
                failureHandler("NetworkError.msgNetworkError")
            }
        }
    }
}
