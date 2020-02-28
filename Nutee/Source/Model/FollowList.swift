//
//  FollowersList.swift
//  Nutee
//
//  Created by Hee Jae Kim on 2020/02/27.
//  Copyright © 2020 S.OWL. All rights reserved.
//

import Foundation

// MARK: - FollowList for followers and followings
struct FollowListElement: Codable {
    let id: Int
    let nickname: String
    let follow: Follow

    enum CodingKeys: String, CodingKey {
        case id, nickname
        case follow = "Follow"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? values.decode(Int.self, forKey: .id)) ?? 0
        nickname = (try? values.decode(String.self, forKey: .nickname)) ?? ""
        follow = (try? values.decode(Follow.self, forKey: .follow)) ??
            Follow.init(createdAt: "", updatedAt: "", followingID: 0, followerID: 0)
    }
}

// MARK: - Follow
struct Follow: Codable {
    let createdAt, updatedAt: String
    let followingID, followerID: Int

    enum CodingKeys: String, CodingKey {
        case createdAt, updatedAt
        case followingID = "followingId"
        case followerID = "followerId"
    }
}

typealias FollowList = [FollowListElement]
