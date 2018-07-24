static int WidgetsOffset = -127;
static bool SubtractOffset = true;
%hook SBDashBoardView
	- (void) setDateViewPageAlignment:(long)alignment {
		%log;
		alignment = 0;
		%orig(alignment);
	}
%end
%hook SBDashBoardTodayPageView
	- (void) setFrame:(CGRect)frame {
		int height = frame.size.height;
		if (SubtractOffset) {
			height = height - WidgetsOffset;
		}
		frame = CGRectMake(0, WidgetsOffset, frame.size.width, height);
		%orig(frame);
	}
%end

static void loadPreferences() {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/pro.relative.nomorenctime.prefs.plist"];
	if (prefs) {
		WidgetsOffset = [prefs objectForKey:@"widgetsOffset"] ? [[prefs objectForKey:@"widgetsOffset"] intValue] : WidgetsOffset;
		SubtractOffset = [prefs objectForKey:@"subtractOffset"] ? [[prefs objectForKey:@"subtractOffset"] boolValue] : true;
	}
	[prefs release];
}

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPreferences, CFSTR("pro.relative.nomorenctime.prefs/updated"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	loadPreferences();
}