static int WidgetsOffset = -127;
%hook SBDashBoardView
	- (void) setDateViewPageAlignment:(long)alignment {
		%log;
		alignment = 0;
		%orig(alignment);
	}
%end
%hook SBDashBoardTodayPageView
	- (void) setFrame:(CGRect)frame {
		frame = CGRectMake(0, WidgetsOffset, frame.size.width, frame.size.height - WidgetsOffset);
		%orig(frame);
	}
%end
/*%hook SBDashBoardTodayViewController
	- (UIEdgeInsets) widgetListViewEdgeInsetsIncludingSearchHeader:(bool)including {
		%log;
		return UIEdgeInsetsMake(30, 0, 0, 0);
	}
	- (UIEdgeInsets) widgetGroupViewController:(id)arg1 including:(NSInteger)including {
		%log;
		return UIEdgeInsetsMake(30, 0, 0, 0);
	}
%end
%hook SBDashBoardTodayPageView
	- (void) setLayoutMargins:(UIEdgeInsets)insets {
		insets = UIEdgeInsetsMake(30, 0, 0, 0);
		%orig(insets);
	}
	- (void) setSafeAreaInsets:(UIEdgeInsets)insets {
		insets = UIEdgeInsetsMake(30, 0, 0, 0);
		%orig(insets);
	}
%end*/
/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/
