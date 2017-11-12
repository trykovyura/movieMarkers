//
// Created by Юрий Трыков on 16.10.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "FilmDetailsDataDisplayManager.h"
#import "FilmDetailsCellObjectBuilder.h"
#import "MarkerCellObject.h"
#import <Nimbus/NimbusModels.h>
#import <extobjc.h>

@interface FilmDetailsDataDisplayManager () <UITableViewDelegate>

@property (nonatomic, strong) NITableViewModel *tableViewModel;
@property (nonatomic, strong) NITableViewActions *tableViewActions;
@property (nonatomic, strong) NSArray *cellObjects;

@end

@implementation FilmDetailsDataDisplayManager

- (void)configureDataDisplayManagerWithFilm:(FilmPlainObject *)film markers:(NSArray *)markers {
    self.cellObjects = [self.cellObjectBuilder cellObjectsForFilm:film markers:markers];
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
    NIActionBlock lectureInfoActionBlock = ^BOOL(MarkerCellObject *object, UIViewController *controller, NSIndexPath* indexPath) {
        @strongify(self)
        NSDecimalNumber *latitude = [object obtainLatitude];
        NSDecimalNumber *longitude = [object obtainLongitude];
        [self.delegate didTapMarker:latitude longitude:longitude];
        return YES;
    };
    [self.tableViewActions attachToClass:[MarkerCellObject class]
                                tapBlock:lectureInfoActionBlock];

    self.tableViewActions.tableViewCellSelectionStyle = UITableViewCellSelectionStyleNone;
}

- (NITableViewModel *)configureTableViewModel {
    NITableViewModel *tableViewModel = [[NITableViewModel alloc] initWithSectionedArray:self.cellObjects
                                                                               delegate:(id)[NICellFactory class]];
    return tableViewModel;
}

@end