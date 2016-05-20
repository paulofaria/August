//
//  Request.swift
//  Request
//
//  Created by Bradley Hilton on 2/5/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

private let request = NSURLRequest()

public struct Request {
    
    public var url: Url = Url()
    public var cachePolicy: NSURLRequestCachePolicy = request.cachePolicy
    public var timeoutInterval: NSTimeInterval = request.timeoutInterval
    public var mainDocumentURL: Url?
    public var networkServiceType: NSURLRequestNetworkServiceType = request.networkServiceType
    public var allowsCellularAccess: Bool = request.allowsCellularAccess
    public var method: Method = .GET
    public var headers: [String : String] = [:]
    public var body: DataSerializable?
    public var shouldHandleCookies = request.HTTPShouldHandleCookies
    public var shouldUsePipelining = request.HTTPShouldUsePipelining
    public var session: Session = .sharedSession
    public var options = [ConvertibleOption]()
    public var logging = false
    
    public var queue = NSOperationQueue.mainQueue()
    internal var startCallbacks = [StartCallback]()
    internal var progressCallbacks = [ProgressCallback]()
    internal var responseCallbacks = [ResponseCallback]()
    internal var errorCallbacks = [ErrorCallback]()
    internal var completionCallbacks = [CompletionCallback]()
    internal var successCallback: SuccessCallback?
    internal var failureCallback: FailureCallback?
    
    public init(_ url: Url) {
        self.url = url
    }
    
    public init(_ string: String = "") {
        self.url = Url(string)
    }
    
    public func build() -> Builder {
        return Builder(self)
    }
    
    public func begin() -> Task {
        return Task(request: self)
    }
    
}