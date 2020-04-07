#!/usr/bin/osascript
-- Open System Preferences and go to the Software Update prefPane
tell application "System Preferences"
	activate
	set the current pane to pane id "com.apple.preferences.softwareupdate"
end tell
tell application "System Preferences"
	reveal pane id "com.apple.preferences.softwareupdate"
end tell
tell application "System Events"
	-- Wait a few seconds, just in case there's a delay in the UI
	delay 15
	-- Look for an update button
	set update_now to a reference to (UI element "Update Now" of group 1 of window "Software Update" of application process "System Preferences")
	-- If the update button exists, click it
	if update_now exists then
		click update_now
		-- Wait a few seconds, just in case there's a delay in the UI
		delay 4
		-- In the new window that appears, see if there's a Download & Restart button
		set download_now to a reference to (UI element "Download & Restart" of sheet 1 of window "Software Update" of application process "System Preferences" of application "System Events")
		-- If there is, click it. When this script runs again later, it may actually be able to install the already downloaded update
		if download_now exists then
			click download_now
		else
			-- See if the restart button to install the downloaded and pending update
			set restart_now to a reference to (UI element "Restart" of sheet 1 of window "Software Update" of application process "System Preferences" of application "System Events")
			if restart_now exists then
				click restart_now
			end if
		end if
	end if
end tell
