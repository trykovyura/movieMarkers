//
// Created by Юрий Трыков on 04.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "FilmFeedDataDisplayManager.h"
#import "FilmFeedCellObjectBuilder.h"
#import "FilmDetailsCellObjectBuilder.h"
#import "FilmFeedCellObject.h"
#import <Nimbus/NimbusModels.h>
#import <extobjc.h>

@interface FilmFeedDataDisplayManager () <UITableViewDelegate>

@property (nonatomic, strong) NITableViewModel *tableViewModel;
@property (nonatomic, strong) NITableViewActions *tableViewActions;
@property (nonatomic, strong) NSArray *cellObjects;

@end

@implementation FilmFeedDataDisplayManager

- (void)configureDataDisplayManagerWithFilms:(NSArray <FilmPlainObject *> *)films {
    self.cellObjects = [self.cellObjectBuilder cellObjectsForFilms:films];
}

#pragma mark DataDisplayManager methods

- (id<UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView {
    self.tableViewModel = [self configureTableViewModel];
    return self.tableViewModel;
}

- (id<UITableViewDelegate>)delegateForTableView:(UITableView *)tableView withBaseDelegate:(id<UITableViewDelegate>)baseTableViewDelegate {
    if (!self.tableViewActions) {
        [self setupActionBlocks];
    }
    return [self.tableViewActions forwardingTo:self];
}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [NICellFactory tableView:tableView heightForRowAtIndexPath:indexPath model:self.tableViewModel];
}

#pragma mark - Private methods

- (void)setupActionBlocks {
    self.tableViewActions = [[NITableViewActions alloc] initWithTarget:self];

    @weakify(self);
    NIActionBlock lectureInfoActionBlock = ^BOOL(FilmFeedCellObject *object, UIViewController *controller, NSIndexPath* indexPath) {
        @strongify(self)
        [self.delegate didTapFilm:object.filmID];
        return YES;
    };
    [self.tableViewActions attachToClass:[FilmFeedCellObject class]
                                tapBlock:lectureInfoActionBlock];

    self.tableViewActions.tableViewCellSelectionStyle = UITableViewCellSelectionStyleNone;
}

- (NITableViewModel *)configureTableViewModel {
    NITableViewModel *tableViewModel = [[NITableViewModel alloc] initWithSectionedArray:self.cellObjects
                                                                               delegate:(id)[NICellFactory class]];

    return tableViewModel;
}

@end