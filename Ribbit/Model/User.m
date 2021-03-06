//
//  User.m
//  Ribbit
//
//  Created by Amit Bijlani on 8/24/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import "User.h"

static NSInteger identifier = 1;

@interface User()
@property (strong,nonatomic) NSMutableArray *friendsMutable;
@end

@implementation User

+ (instancetype) currentUser {
  static User *sharedUser = nil;
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedUser = [[self alloc] init];
    sharedUser.username = @"Current user";
    sharedUser.objectId = @"100";
    sharedUser.friendsMutable = [NSMutableArray array];
  });
  
  return sharedUser;
}

+ (instancetype)userWithUsername:(NSString*)username {
  User *user = [[self alloc] init];
  if ( user ) {
    user.username = username;
    user.objectId = [NSString stringWithFormat:@"%ld",(long)++identifier];
  }
  return user;
}

- (void)addFriend:(User *)friend {
  [self.friendsMutable addObject:friend];
}

//Bug Fix 4
- (void)removeFriend:(User *)friend index:(NSInteger)indexPath {
    if (indexPath < [_friendsMutable count]){
        [self.friendsMutable removeObjectAtIndex:indexPath];
    }
    
}

- (NSArray*) friends {
  return self.friendsMutable;
}


@end
