// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let hotPosts = try? newJSONDecoder().decode(HotPosts.self, from: jsonData)

import Foundation

// MARK: - HotPosts
struct HotPosts: Codable {
    let kind: String
    let data: HotPostsData
}

// MARK: - HotPostsData
struct HotPostsData: Codable {
    let after: String
    let dist: Int
    let modhash, geoFilter: JSONNull?
    let children: [Child]
    let before: JSONNull?

    enum CodingKeys: String, CodingKey {
        case after, dist, modhash
        case geoFilter = "geo_filter"
        case children, before
    }
}

// MARK: - Child
struct Child: Codable {
    let data: ChildData
}

// MARK: - ChildData
struct ChildData: Codable {
    let approvedAtUTC: JSONNull?
    let subreddit, selftext, authorFullname: String
    let saved: Bool
    let modReasonTitle: JSONNull?
    let gilded: Int
    let clicked: Bool
    let title: String
    let linkFlairRichtext: [LinkFlairRichtext]
    let subredditNamePrefixed: String
    let hidden: Bool
    let pwls: Int
    let linkFlairCSSClass: String?
    let downs: Int
    let thumbnailHeight: Int?
    let topAwardedType: String?
    let hideScore: Bool
    let name: String
    let quarantine: Bool
    let linkFlairTextColor: FlairTextColor
    let upvoteRatio: Double
    let authorFlairBackgroundColor: String?
    let subredditType: SubredditType
    let ups, totalAwardsReceived: Int
    let mediaEmbed: MediaEmbed
    let thumbnailWidth: Int?
    let authorFlairTemplateID: String?
    let isOriginalContent: Bool
    let userReports: [JSONAny]
    let secureMedia: Media?
    let isRedditMediaDomain, isMeta: Bool
    let category: JSONNull?
    let secureMediaEmbed: MediaEmbed
    let linkFlairText: String?
    let canModPost: Bool
    let score: Int
    let approvedBy: JSONNull?
    let isCreatedFromAdsUI, authorPremium: Bool
    let thumbnail: String
    let edited: Bool
    let authorFlairCSSClass: String?
    let authorFlairRichtext: [JSONAny]
    let gildings: Gildings
    let postHint: String?
    let contentCategories: [String]?
    let isSelf: Bool
    let modNote: JSONNull?
    let created: Int
    let linkFlairType: AuthorFlairType
    let wls: Int
    let removedByCategory, bannedBy: JSONNull?
    let authorFlairType: AuthorFlairType
    let domain: String
    let allowLiveComments: Bool
    let selftextHTML, likes: JSONNull?
    let suggestedSort: String?
    let bannedAtUTC: JSONNull?
    let urlOverriddenByDest: String?
    let viewCount: JSONNull?
    let archived, noFollow, isCrosspostable, pinned: Bool
    let over18: Bool
    let preview: Preview?
    let allAwardings: [AllAwarding]
    let awarders: [JSONAny]
    let mediaOnly, canGild, spoiler, locked: Bool
    let authorFlairText: String?
    let treatmentTags: [JSONAny]
    let visited: Bool
    let removedBy, numReports, distinguished: JSONNull?
    let subredditID: String
    let authorIsBlocked: Bool
    let modReasonBy, removalReason: JSONNull?
    let linkFlairBackgroundColor: LinkFlairBackgroundColor
    let id: String
    let isRobotIndexable: Bool
    let reportReasons: JSONNull?
    let author: String
    let discussionType: JSONNull?
    let numComments: Int
    let sendReplies: Bool
    let whitelistStatus: WhitelistStatus
    let contestMode: Bool
    let modReports: [JSONAny]
    let authorPatreonFlair: Bool
    let authorFlairTextColor: FlairTextColor?
    let permalink: String
    let parentWhitelistStatus: WhitelistStatus
    let stickied: Bool
    let url: String
    let subredditSubscribers, createdUTC, numCrossposts: Int
    let media: Media?
    let isVideo: Bool
    let linkFlairTemplateID: String?
    let isGallery: Bool?
    let mediaMetadata: [String: MediaMetadatum]?
    let galleryData: GalleryData?

    enum CodingKeys: String, CodingKey {
        case approvedAtUTC = "approved_at_utc"
        case subreddit, selftext
        case authorFullname = "author_fullname"
        case saved
        case modReasonTitle = "mod_reason_title"
        case gilded, clicked, title
        case linkFlairRichtext = "link_flair_richtext"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case hidden, pwls
        case linkFlairCSSClass = "link_flair_css_class"
        case downs
        case thumbnailHeight = "thumbnail_height"
        case topAwardedType = "top_awarded_type"
        case hideScore = "hide_score"
        case name, quarantine
        case linkFlairTextColor = "link_flair_text_color"
        case upvoteRatio = "upvote_ratio"
        case authorFlairBackgroundColor = "author_flair_background_color"
        case subredditType = "subreddit_type"
        case ups
        case totalAwardsReceived = "total_awards_received"
        case mediaEmbed = "media_embed"
        case thumbnailWidth = "thumbnail_width"
        case authorFlairTemplateID = "author_flair_template_id"
        case isOriginalContent = "is_original_content"
        case userReports = "user_reports"
        case secureMedia = "secure_media"
        case isRedditMediaDomain = "is_reddit_media_domain"
        case isMeta = "is_meta"
        case category
        case secureMediaEmbed = "secure_media_embed"
        case linkFlairText = "link_flair_text"
        case canModPost = "can_mod_post"
        case score
        case approvedBy = "approved_by"
        case isCreatedFromAdsUI = "is_created_from_ads_ui"
        case authorPremium = "author_premium"
        case thumbnail, edited
        case authorFlairCSSClass = "author_flair_css_class"
        case authorFlairRichtext = "author_flair_richtext"
        case gildings
        case postHint = "post_hint"
        case contentCategories = "content_categories"
        case isSelf = "is_self"
        case modNote = "mod_note"
        case created
        case linkFlairType = "link_flair_type"
        case wls
        case removedByCategory = "removed_by_category"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case domain
        case allowLiveComments = "allow_live_comments"
        case selftextHTML = "selftext_html"
        case likes
        case suggestedSort = "suggested_sort"
        case bannedAtUTC = "banned_at_utc"
        case urlOverriddenByDest = "url_overridden_by_dest"
        case viewCount = "view_count"
        case archived
        case noFollow = "no_follow"
        case isCrosspostable = "is_crosspostable"
        case pinned
        case over18 = "over_18"
        case preview
        case allAwardings = "all_awardings"
        case awarders
        case mediaOnly = "media_only"
        case canGild = "can_gild"
        case spoiler, locked
        case authorFlairText = "author_flair_text"
        case treatmentTags = "treatment_tags"
        case visited
        case removedBy = "removed_by"
        case numReports = "num_reports"
        case distinguished
        case subredditID = "subreddit_id"
        case authorIsBlocked = "author_is_blocked"
        case modReasonBy = "mod_reason_by"
        case removalReason = "removal_reason"
        case linkFlairBackgroundColor = "link_flair_background_color"
        case id
        case isRobotIndexable = "is_robot_indexable"
        case reportReasons = "report_reasons"
        case author
        case discussionType = "discussion_type"
        case numComments = "num_comments"
        case sendReplies = "send_replies"
        case whitelistStatus = "whitelist_status"
        case contestMode = "contest_mode"
        case modReports = "mod_reports"
        case authorPatreonFlair = "author_patreon_flair"
        case authorFlairTextColor = "author_flair_text_color"
        case permalink
        case parentWhitelistStatus = "parent_whitelist_status"
        case stickied, url
        case subredditSubscribers = "subreddit_subscribers"
        case createdUTC = "created_utc"
        case numCrossposts = "num_crossposts"
        case media
        case isVideo = "is_video"
        case linkFlairTemplateID = "link_flair_template_id"
        case isGallery = "is_gallery"
        case mediaMetadata = "media_metadata"
        case galleryData = "gallery_data"
    }
}

// MARK: - AllAwarding
struct AllAwarding: Codable {
    let giverCoinReward: Int?
    let subredditID: JSONNull?
    let isNew: Bool
    let daysOfDripExtension, coinPrice: Int
    let id: String
    let pennyDonate: Int?
    let awardSubType: AwardSubType
    let coinReward: Int
    let iconURL: String
    let daysOfPremium: Int
    let tiersByRequiredAwardings: JSONNull?
    let resizedIcons: [ResizedIcon]
    let iconWidth, staticIconWidth: Int
    let startDate: Int?
    let isEnabled: Bool
    let awardingsRequiredToGrantBenefits: JSONNull?
    let allAwardingDescription: String
    let endDate: JSONNull?
    let subredditCoinReward, count, staticIconHeight: Int
    let name: String
    let resizedStaticIcons: [ResizedIcon]
    let iconFormat: IconFormat?
    let iconHeight: Int
    let pennyPrice: Int?
    let awardType: AwardType
    let staticIconURL: String

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

enum AwardSubType: String, Codable {
    case community = "COMMUNITY"
    case global = "GLOBAL"
    case premium = "PREMIUM"
}

enum AwardType: String, Codable {
    case community = "community"
    case global = "global"
}

enum IconFormat: String, Codable {
    case apng = "APNG"
    case jpg = "JPG"
    case png = "PNG"
}

// MARK: - ResizedIcon
struct ResizedIcon: Codable {
    let url: String
    let width, height: Int
}

enum FlairTextColor: String, Codable {
    case dark = "dark"
    case light = "light"
}

enum AuthorFlairType: String, Codable {
    case richtext = "richtext"
    case text = "text"
}

// MARK: - GalleryData
struct GalleryData: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let mediaID: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case mediaID = "media_id"
        case id
    }
}

// MARK: - Gildings
struct Gildings: Codable {
    let gid1, gid3, gid2: Int?

    enum CodingKeys: String, CodingKey {
        case gid1 = "gid_1"
        case gid3 = "gid_3"
        case gid2 = "gid_2"
    }
}

enum LinkFlairBackgroundColor: String, Codable {
    case e4A966 = "#e4a966"
    case empty = ""
}

// MARK: - LinkFlairRichtext
struct LinkFlairRichtext: Codable {
    let e: AuthorFlairType
    let t: String
}

// MARK: - Media
struct Media: Codable {
    let redditVideo: RedditVideo

    enum CodingKeys: String, CodingKey {
        case redditVideo = "reddit_video"
    }
}

// MARK: - RedditVideo
struct RedditVideo: Codable {
    let bitrateKbps: Int
    let fallbackURL: String
    let height, width: Int
    let scrubberMediaURL: String
    let dashURL: String
    let duration: Int
    let hlsURL: String
    let isGIF: Bool
    let transcodingStatus: String

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
    let status, e, m: String
    let p: [S]
    let s: S
    let id: String
}

// MARK: - S
struct S: Codable {
    let y, x: Int
    let u: String
}

enum WhitelistStatus: String, Codable {
    case allAds = "all_ads"
    case promoAdultNsfw = "promo_adult_nsfw"
}

// MARK: - Preview
struct Preview: Codable {
    let images: [AppImage]
    let enabled: Bool
}

// MARK: - Image
struct AppImage: Codable {
    let source: ResizedIcon
    let resolutions: [ResizedIcon]
    let variants: Variants
    let id: String
}

// MARK: - Variants
struct Variants: Codable {
    let gif, mp4: GIF?
}

// MARK: - GIF
struct GIF: Codable {
    let source: ResizedIcon
    let resolutions: [ResizedIcon]
}

enum SubredditType: String, Codable {
    case subredditTypePublic = "public"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
