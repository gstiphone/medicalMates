//
//  JsonLoader.h
//  MedicalMates
//
//  Created by User on 05/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonLoader : NSObject

-(NSArray *)arrayFromJson:(NSURL *)url;
-(NSDictionary *)dictioneryFromJson:(NSURL *)url;


@end
