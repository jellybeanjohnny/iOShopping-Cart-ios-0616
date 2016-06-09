//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Matt Amerige on 6/8/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents
{
	if (self.items.count == 0) {
		return 0;
	}
	
	// add all prices
	NSUInteger sum = 0;
	for (FISItem *item in self.items) {
		sum += item.priceInCents;
	}
	return sum;
}

- (void)addItem:(FISItem *)item
{
	[self.items addObject:item];
}

- (void)removeItem:(FISItem *)item
{
	// Find index of item matching this object
	NSUInteger index = [self.items indexOfObject:item];
	[self.items removeObjectAtIndex:index];
}

- (void)removeAllItemsLikeItem:(FISItem *)item
{
	[self.items removeObject:item];
}

- (void)sortItemsByNameAsc
{
	NSSortDescriptor *sortbyNameDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
	[self.items sortUsingDescriptors:@[sortbyNameDescriptor]];
}

- (void)sortItemsByNameDesc
{
	NSSortDescriptor *sortByNameDescending = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
	[self.items sortUsingDescriptors:@[sortByNameDescending]];
}

- (void)sortItemsByPriceInCentsAsc
{
	NSSortDescriptor *sortbyPriceAcsending = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
	[self.items sortUsingDescriptors:@[sortbyPriceAcsending]];
}

- (void)sortItemsByPriceInCentsDesc
{
	NSSortDescriptor *sortbyPriceDescending = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
	[self.items sortUsingDescriptors:@[sortbyPriceDescending]];
}

- (NSArray *)allItemsWithName:(NSString *)name
{
	NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name = %@", name];
 	NSArray *filteredArray = [self.items filteredArrayUsingPredicate:namePredicate];
	
	return filteredArray;
}

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price
{
	NSPredicate *minPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %ld", price];
	NSArray *filteredArray = [self.items filteredArrayUsingPredicate:minPricePredicate];
	
	return filteredArray;
}

- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price
{
	NSPredicate *maxPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %ld", price];
	NSArray *filteredArray = [self.items filteredArrayUsingPredicate:maxPricePredicate];
	
	return filteredArray;
}



@end
