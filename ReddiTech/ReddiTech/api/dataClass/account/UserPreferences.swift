//
//  UserPreferences.swift
//  ReddiTech
//
//  Created by Anthony Luong on 26/02/2022.
//

import Foundation

// MARK: - UserPreferences
struct UserPreferences: Codable {
    var beta: Bool?
    var default_theme_sr: JSONNull?
    var threaded_messages: Bool?
    var email_comment_reply: Bool?
    var private_feeds: Bool?
    var activity_relevant_ads: Bool?
    var email_messages: Bool?
    var profile_opt_out: Bool?
    var video_autoplay: Bool?
    var email_private_message: Bool?
    var geopopular: String?
    var show_link_flair: Bool?
    var show_trending: Bool?
    var send_welcome_messages: Bool?
    var country_code: String?
    var design_beta: Bool?
    var monitor_mentions: Bool?
    var hide_downs: Bool?
    var clickgadget: Bool?
    var lang: String?
    var ignore_suggested_sort: Bool?
    var show_presence: Bool?
    var email_upvote_comment: Bool?
    var email_digests: Bool?
    var layout: String?
    var num_comments: Int?
    var feed_recommendations_enabled: Bool?
    var label_nsfw: Bool?
    var research: Bool?
    var use_global_defaults: Bool?
    var show_snoovatar: Bool?
    var over_18: Bool?
    var legacy_search: Bool?
    var live_orangereds: Bool?
    var highlight_controversial: Bool?
    var no_profanity: Bool?
    var domain_details: Bool?
    var collapse_left_bar: Bool?
    var email_community_discovery: Bool?
    var bad_comment_autocollapse: String?
    var hide_ups: Bool?
    var third_party_data_personalized_ads: Bool?
    var email_chat_request: Bool?
    var allow_clicktracking: Bool?
    var hide_from_robots: Bool?
    var show_twitter: Bool?
    var compress: Bool?
    var accept_pms: String?
    var store_visits: Bool?
    var threaded_modmail: Bool?
    var email_upvote_post: Bool?
    var min_link_score: Int?
    var media_preview: String?
    var email_user_new_follower: Bool?
    var nightmode: Bool?
    var enable_default_themes: Bool?
    var third_party_site_data_personalized_content: Bool?
    var third_party_site_data_personalized_ads: Bool?
    var survey_last_seen_time: JSONNull?
    var show_stylesheets: Bool?
    var enable_followers: Bool?
    var email_new_user_welcome: Bool?
    var public_votes: Bool?
    var email_post_reply: Bool?
    var collapse_read_messages: Bool?
    var show_flair: Bool?
    var mark_messages_read: Bool?
    var search_include_over_18: Bool?
    var hide_ads: Bool?
    var third_party_personalized_ads: Bool?
    var email_username_mention: Bool?
    var top_karma_subreddits: Bool?
    var newwindow: Bool?
    var numsites: Int?
    var min_comment_score: Int?
    var send_crosspost_messages: Bool?
    var media: String?
    var public_server_seconds: Bool?
    var show_gold_expiration: Bool?
    var highlight_new_comments: Bool?
    var email_unsubscribe_all: Bool?
    var default_comment_sort: String?
    var show_location_based_recommendations: Bool?
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
