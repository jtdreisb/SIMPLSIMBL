//
//  SearchSaver.m
//  SimpleSIMBL
//
//  Created by Jason Dreisbach on 11/12/09.
//  Copyright 2009 Jason Dreisbach. All rights reserved.
//

#import "SearchSaver.h"

@implementation WebSearchField (SearchSaverSwizzle) 
{
}
- (void) __appkit_insertNewline:(id)sender;			//At runtime these will point to the origional implementation

@end

@implementation WebSearchField (SearchSaver)

- (void) __swizzled_insertNewline:(id)sender
{
	
}

//Methods that will "swizzle" the methods taken from the Megazoomer project

+ (void) swizzle:(struct objc_method *)custom
{
    SEL custom_sel = custom->method_name;
    NSString *name = NSStringFromSelector(custom_sel);
    
	// __swizzled_ <- 11 characters
    name = [name substringFromIndex:11];
    SEL old_sel = NSSelectorFromString(name);
    SEL new_sel = NSSelectorFromString([NSString stringWithFormat:@"__appkit_%@", name]);
    
    struct objc_method *old = class_getInstanceMethod([self class], old_sel);
    
    if (old == NULL) {
        return;
    }
    
    custom->method_name = old_sel;
    old->method_name = new_sel;
}

+ (void)swizzleMethods
{
	void *iter = 0;
    struct objc_method_list *mlist;
    while (mlist = class_nextMethodList([self class], &iter)) {	
        int i;
        for (i=0; i<mlist->method_count; i++) {
            struct objc_method *m = mlist->method_list + i;
            NSString *name = NSStringFromSelector(m->method_name);
            if ([name hasPrefix:@"__swizzled_"]) {
                [self swizzle:m];
            }
        }
    }
}
@end
