//
//  JsonLoader.m
//  MedicalMates
//
//  Created by User on 05/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "JsonLoader.h"

@implementation JsonLoader

-(id)init{
    
    self=[super init];
    
    
    
    return (self);
}



-(NSDictionary *)dictioneryFromJson:(NSURL *)url{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response=[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    //  NSDictionary *dic = [NSDictionary dictionaryWithDictionary:jdata];
    
    return dic;
}





-(NSArray *)arrayFromJson:(NSURL *)url{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:0.5];
    NSURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    id jdata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *array = [NSArray arrayWithArray:jdata];
    
    return array;
    
}


@end
