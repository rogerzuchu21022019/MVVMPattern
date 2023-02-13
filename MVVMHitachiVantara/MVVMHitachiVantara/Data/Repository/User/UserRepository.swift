//
//  UserRepository.swift
//  MVVMHitachiVantara
//
//  Created by Vu Thanh Nam on 21/06/2022.
//

import Foundation
import CoreData
import RxSwift
class UserRepository: BaseRepository,BaseRepositoryProtocol {
    typealias T = User
    static var shared = UserRepository()
    
    var userService = UserService.shared
    ///data from API
    func getUsers(url:String,completion: @escaping TypeResult<[User]>) -> Observable<[User]>{
        print("Success2 From UserRepository")
        return self.userService.getAll(url: url, completion:  completion)
    }
    func getUser(url:String,parameters:[String:Any]?) -> Observable<User>{
        return self.userService.get(url: url, parameters: parameters)
    }
    
    func createUser(url:String,parametrs:[String:Any]?,completion: @escaping TypeResult<User>) -> Observable<User>{
        return self.userService.post(url: url, parameters: parametrs)
    }
    
    ///data from NSManagedObject
    func add(type user: User) {
        let cdUser = CDUser(context:PersistentStorage.shared.context)
        cdUser.login = user.login
        cdUser.id = Int64(user.id)
        cdUser.node_id = user.node_id
        cdUser.gravatar_id = user.gravatar_id
        cdUser.url = user.url
        cdUser.html_url = user.html_url
        cdUser.gists_url = user.gists_url
        cdUser.starred_url = user.starred_url
        cdUser.subscriptions_url = user.subscriptions_url
        cdUser.organizations_url = user.organizations_url
        cdUser.repos_url = user.repos_url
        cdUser.events_url = user.events_url
        cdUser.received_events_url = user.received_events_url
        cdUser.type = user.type
        cdUser.site_admin = user.site_admin
        cdUser.name = user.name ?? ""
        cdUser.company = user.company ?? ""
        cdUser.blog = user.blog ?? ""
        cdUser.location = user.location ?? ""
        cdUser.email = user.email ?? ""
        cdUser.hireable = user.hireable ?? ""
        cdUser.bio = user.bio ?? ""
        cdUser.twitter_username = user.twitter_username ?? ""
        cdUser.public_gists = (user.public_gists ?? 0)
        cdUser.public_repos = (user.public_repos ?? 0)
        cdUser.following = (user.following ?? 0)
        cdUser.followers = (user.followers ?? 0.0)
        cdUser.followers_url = user.followers_url
        cdUser.avatar_url = user.avatar_url
        cdUser.created_at  = user.created_at ?? ""
        cdUser.updated_at = user.updated_at ?? ""
        PersistentStorage.shared.saveContext()
    }
    
    func update(type user: User) {
        let cdUser = getCDUser(byID: user.id)
        cdUser?.login = user.login
        cdUser?.id = Int64(user.id)
        cdUser?.node_id = user.node_id
        cdUser?.gravatar_id = user.gravatar_id
        cdUser?.url = user.url
        cdUser?.html_url = user.html_url
        cdUser?.gists_url = user.gists_url
        cdUser?.starred_url = user.starred_url
        cdUser?.subscriptions_url = user.subscriptions_url
        cdUser?.organizations_url = user.organizations_url
        cdUser?.repos_url = user.repos_url
        cdUser?.events_url = user.events_url
        cdUser?.received_events_url = user.received_events_url
        cdUser?.type = user.type
        cdUser?.site_admin = user.site_admin
        cdUser?.name = user.name ?? ""
        cdUser?.company = user.company ?? ""
        cdUser?.blog = user.blog ?? ""
        cdUser?.location = user.location ?? ""
        cdUser?.email = (user.email) ?? ""
        cdUser?.hireable = user.hireable ?? ""
        cdUser?.bio = user.bio ?? ""
        cdUser?.twitter_username = user.twitter_username ?? ""
        cdUser?.public_gists = user.public_gists ?? 0
        cdUser?.public_repos = user.public_repos ?? 0
        cdUser?.following = user.following ?? 0
        cdUser?.followers = user.followers ?? 0.0
        cdUser?.followers_url = user.followers_url
        cdUser?.avatar_url = user.avatar_url
        cdUser?.created_at  = user.created_at ?? ""
        cdUser?.updated_at = user.updated_at ?? ""
        PersistentStorage.shared.saveContext()
    }

    
    func get(type id: Int) -> User? {
        let getCdUser = getCDUser(byID: id)
        guard getCdUser != nil else {return nil}
        return (getCdUser?.convertFromNSManagedObjectToModel())!
    }
    
    
    func delete(type user: User) {
        
        let cdUser = getCDUser(byID: user.id)
        guard cdUser != nil else {return }
        PersistentStorage.shared.context.delete(cdUser!)
        PersistentStorage.shared.saveContext()
    }
    
    func getList() -> [User] {
        var users : [User] = []
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDUser.self)
        result?.forEach({
            user in
            users.append(user.convertFromNSManagedObjectToModel())
        })
        return users
    }
    
    ///predicate CDUser with id
    func getCDUser(byID id:Int) -> CDUser? {
        let fetchRequest = NSFetchRequest<CDUser>(entityName: "CDUser")
        let predicate = NSPredicate(format: "id == %d",  id)
        
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {return nil}
            return result!
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
