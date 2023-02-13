//
//  UserCore+CoreDataProperties.swift
//  
//
//  Created by Vu Thanh Nam on 17/06/2022.
//
//

import Foundation
import CoreData


public extension UserCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCore> {
        return NSFetchRequest<UserCore>(entityName: "UserCore")
    }

    @NSManaged public var avatar_url: String?
    @NSManaged public var create_at: String?
    @NSManaged public var id: Int32
    @NSManaged public var login: String?
    @NSManaged public var node_id: String?
    @NSManaged public var gravatar_id: String?
    @NSManaged public var url: String?
    @NSManaged public var html_url: String?
    @NSManaged public var followers_url: String?
    @NSManaged public var gists_url: String?
    @NSManaged public var starred_url: String?
    @NSManaged public var subscriptions_url: String?
    @NSManaged public var organizations_url: String?
    @NSManaged public var repos_url: String?
    @NSManaged public var events_url: String?
    @NSManaged public var received_events_url: String?
    @NSManaged public var type: String?
    @NSManaged public var site_admin: Bool
    @NSManaged public var name: String?
    @NSManaged public var company: String?
    @NSManaged public var blog: String?
    @NSManaged public var location: String?
    @NSManaged public var email: String?
    @NSManaged public var hireable: String?
    @NSManaged public var bio: String?
    @NSManaged public var twitter_username: String?
    @NSManaged public var public_repos: String?
    @NSManaged public var public_gists: String?
    @NSManaged public var followers: Double
    @NSManaged public var following: Int32
    @NSManaged public var created_at: String?
    @NSManaged public var updated_at: String?

    func convertUserCoreToUser()->User{
        return User(login: self.login, id: self.id, node_id: self.node_id, avatar_url: self.avatar_url, gravatar_id: self.gravatar_id, url: self.url, html_url: self.html_url, followers_url: self.followers_url, gists_url: self.gists_url, starred_url: self.starred_url, subscriptions_url: self.subscriptions_url, organizations_url: self.organizations_url, repos_url: self.repos_url, events_url: self.events_url, received_events_url: self.received_events_url, type: self.type, site_admin: self.site_admin)
    }
}
extension UserCore : Identifiable {

}
