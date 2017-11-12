//
// Created by Юрий Трыков on 05.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKMappingProtocol.h"


@interface FilmPlainObject : NSObject

@property (nonatomic, copy) NSString *filmID;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *descriptionFilm;
@property (nonatomic, copy) NSString *filmLength;
@property (nonatomic, copy) NSString *genre;
@property (nonatomic, copy) NSString *nameEN;
@property (nonatomic, copy) NSString *nameRU;
@property (nonatomic, copy) NSString *posterURL;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *year;

@end