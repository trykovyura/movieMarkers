//
//  DataDisplayManager.h
//  Movie Markers
//
//  Created by Юрий Трыков on 09.05.16.
//  Copyright © 2016 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DataDisplayManager <NSObject>

/**
 *
 *  Метод, отдающий dataSource для таблицы.
 *
 *  @param tableView Контроллер, чья таблица нас интересует
 *
 *  @return (id<UITableViewDataSource>)
 */
- (id <UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView;

/**
 *
 *  Метод, отдающий делегата для таблицы. Сам DDM в данном случае не выступает делегатом напрямую.
 *
 *  @param tableView      Таблица, делегат для которой нам нужен
 *  @param baseTableViewDelegate Основной делегат таблицы (к примеру, UITableViewController) - этот параметр нужен для форвардинга части делегатных методов
 *
 *  @return Делегат для таблицы
 */
- (id <UITableViewDelegate>)delegateForTableView:(UITableView *)tableView withBaseDelegate:(id <UITableViewDelegate>)baseTableViewDelegate;

@end
