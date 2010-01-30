//
//  PluginLoader.m
//  SimpleSIMBL
//
//  Created by Jason Dreisbach on 11/12/09.
//  Copyright 2009 Jason Dreisbach. All rights reserved.
//

#import "PluginLoader.h"


@implementation PluginLoader

+ (void)load
{
	//PluginLoader * plugin = [PluginLoader sharedInstance];
	
	//Do additional setup such as add menu items or windows/GUI
	
	//Swizzle the methods of any class we are customizing
	//[NSButton swizzleMethods];

}

+ (PluginLoader *) sharedInstance
{
	static PluginLoader * plugin = nil;
	
	if (!plugin) 
	{
		plugin = [[PluginLoader alloc] init];
	}
	
	return plugin;
}
@end
