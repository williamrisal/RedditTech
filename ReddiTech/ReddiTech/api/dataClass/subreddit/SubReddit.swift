//
//  SubReddit.swift
//  ReddiTech
//
//  Created by Anthony Luong on 27/02/2022.
//

import Foundation

// MARK: - SubReddit
struct SubReddit: Codable {
    var kind: String
    var data: SubRedditData
}

// MARK: - SubRedditData
struct SubRedditData: Codable {
    var after: String
    var dist: Int
    var modhash, geoFilter: JSONNull?
    var children: [Child]
    var before: JSONNull?

    enum CodingKeys: String, CodingKey {
        case after, dist, modhash
        case geoFilter = "geo_filter"
        case children, before
    }
}

// MARK: - Child
struct Child: Codable {
    var kind: String?
    var data: SubChildData
}

// MARK: - ChildData
struct SubChildData: Codable {
    //var approvedAtUTC: JSONNull?
    var subreddit: String
    var selftext, authorFullname: String
    var saved: Bool
    var modReasonTitle: JSONNull?
    var gilded: Int
    var clicked: Bool
    var title: String
    var linkFlairRichtext: [FlairRichtext]
    var subredditNamePrefixed: String?
    var hidden: Bool
    var pwls: Int
    var linkFlairCSSClass: String
    var downs: Int
    var topAwardedType: JSONNull?
    var hideScore: Bool
    var name: String
    var quarantine: Bool
    var linkFlairTextColor: String
    var upvoteRatio: Double
    var authorFlairBackgroundColor: String?
    var subredditType: String
    var ups, totalAwardsReceived: Int
    //var mediaEmbed: MediaEmbed
    var authorFlairTemplateID: String?
    var isOriginalContent: Bool
    //var userReports: [JSONAny]
    //var secureMedia: Media?
    var isRedditMediaDomain, isMeta: Bool
    var category: String?
    var linkFlairText: String
    var canModPost: Bool
    var score: Int
    var approvedBy: JSONNull?
    var isCreatedFromAdsUI, authorPremium: Bool
    var thumbnail: String
    var edited: Edited
    var authorFlairCSSClass: JSONNull?
    var authorFlairRichtext: [FlairRichtext]
   // var gildings: Gildings
    var contentCategories: JSONNull?
    var isSelf: Bool
    var modNote: JSONNull?
    var created: Int
    var linkFlairType: FlairType
    var wls: Int
    var removedByCategory, bannedBy: JSONNull?
    var authorFlairType: FlairType
    var domain: Domain
    var allowLiveComments: Bool
    var selftextHTML: String?
    var likes, suggestedSort, bannedAtUTC, viewCount: JSONNull?
    var archived, noFollow, isCrosspostable, pinned: Bool
    var over18: Bool
    var allAwardings: [AllAwarding]
    var mediaOnly: Bool
    var linkFlairTemplateID: String
    var canGild, spoiler, locked: Bool
    var authorFlairText: String?
    var visited: Bool
    var removedBy, numReports, distinguished: JSONNull?
    var subredditID: String?
    var authorIsBlocked: Bool
    var modReasonBy, removalReason: JSONNull?
    //var linkFlairBackgroundColor: LinkFlairBackgroundColor
    var id: String
    var isRobotIndexable: Bool
    var reportReasons: JSONNull?
    var author: String
    var discussionType: JSONNull?
    var numComments: Int
    var sendReplies: Bool
    //var whitelistStatus: S
    var authorPatreonFlair: Bool
    var authorFlairTextColor: String?
    var permalink: String
    //var parentWhitelistStatus: WhitelistStatus
    var stickied: Bool
    var url: String
    var isVideo: Bool

}

// MARK: - AllAwarding
struct AllAwarding: Codable {
    var giverCoinReward, subredditID: JSONNull?
    var isNew: Bool
    var daysOfDripExtension, coinPrice: Int
    var id: String
    var pennyDonate: JSONNull?
    var awardSubType: String
    var coinReward: Int
    var iconURL: String
    var daysOfPremium: Int
    var tiersByRequiredAwardings: JSONNull?
    var resizedIcons: [ResizedIcon]
    var iconWidth, staticIconWidth: Int
    var startDate: JSONNull?
    var isEnabled: Bool
    var awardingsRequiredToGrantBenefits: JSONNull?
    var allAwardingDescription: String
    var endDate: JSONNull?
    var subredditCoinReward, count, staticIconHeight: Int
    var name: String
    var resizedStaticIcons: [ResizedIcon]
    var iconFormat: JSONNull?
    var iconHeight: Int
    var pennyPrice: JSONNull?
    var awardType: String
    var staticIconURL: String

    enum CodingKeys: String, CodingKey {
        case giverCoinReward = "giver_coin_reward"
        case subredditID = "subreddit_id"
        case isNew = "is_new"
        case daysOfDripExtension = "days_of_drip_extension"
        case coinPrice = "coin_price"
        case id
        case pennyDonate = "penny_donate"
        case awardSubType = "award_sub_type"
        case coinReward = "coin_reward"
        case iconURL = "icon_url"
        case daysOfPremium = "days_of_premium"
        case tiersByRequiredAwardings = "tiers_by_required_awardings"
        case resizedIcons = "resized_icons"
        case iconWidth = "icon_width"
        case staticIconWidth = "static_icon_width"
        case startDate = "start_date"
        case isEnabled = "is_enabled"
        case awardingsRequiredToGrantBenefits = "awardings_required_to_grant_benefits"
        case allAwardingDescription = "description"
        case endDate = "end_date"
        case subredditCoinReward = "subreddit_coin_reward"
        case count
        case staticIconHeight = "static_icon_height"
        case name
        case resizedStaticIcons = "resized_static_icons"
        case iconFormat = "icon_format"
        case iconHeight = "icon_height"
        case pennyPrice = "penny_price"
        case awardType = "award_type"
        case staticIconURL = "static_icon_url"
    }
}

// MARK: - ResizedIcon
struct ResizedIcon: Codable {
    var url: String
    var width, height: Int
}

// MARK: - FlairRichtext
struct FlairRichtext: Codable {
    var a: A?
    var e: E
    var u: String?
    var t: String?
}

enum A: String, Codable {
    case framework = ":framework:"
    case linux = ":linux:"
    case windows = ":windows:"
}

enum E: String, Codable {
    case emoji = "emoji"
    case text = "text"
}

enum FlairType: String, Codable {
    case richtext = "richtext"
    case text = "text"
}

enum Domain: String, Codable {
    case iImgurCOM = "i.imgur.com"
    case iReddIt = "i.redd.it"
    case selfFramework = "self.framework"
    case vReddIt = "v.redd.it"
}

enum Edited: Codable {
    case bool(Bool)
    case integer(Int)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        throw DecodingError.typeMismatch(Edited.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Edited"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        }
    }
}



// MARK: - Media
struct Media: Codable {
    var redditVideo: RedditVideo

    enum CodingKeys: String, CodingKey {
        case redditVideo = "reddit_video"
    }
}

// MARK: - RedditVideo
struct RedditVideo: Codable {
    var bitrateKbps: Int
    var fallbackURL: String
    var height, width: Int
    var scrubberMediaURL: String
    var dashURL: String
    var duration: Int
    var hlsURL: String
    var isGIF: Bool
    var transcodingStatus: String

    enum CodingKeys: String, CodingKey {
        case bitrateKbps = "bitrate_kbps"
        case fallbackURL = "fallback_url"
        case height, width
        case scrubberMediaURL = "scrubber_media_url"
        case dashURL = "dash_url"
        case duration
        case hlsURL = "hls_url"
        case isGIF = "is_gif"
        case transcodingStatus = "transcoding_status"
    }
}

// MARK: - MediaEmbed
struct MediaEmbed: Codable {
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    var status, e, m: String
    var p: [S]
    var s: S
    var id: String
}

// MARK: - S
struct S: Codable {
    var y, x: Int
    var u: String
}




