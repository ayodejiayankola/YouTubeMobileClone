//
//  Constants.swift
//  YouTubeMobileClone
//
//  Created by Ayodejii Ayankola on 19/11/2021.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyCxDh-mkakr-ROCP7lDtttA44DzB_WP_zY"
    static var PLAYLIST_ID = "PL8qNHf2lQUP96YyqPpHzKd5pNQ7yH2Rr9"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
}

