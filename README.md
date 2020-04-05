# Sys Pref Software Update (spsu)

## Important note
At this point, spsu is more of a *proof-of-concept* than an actual viable project that's fully fleshed out and recommended.

## What does this do?
This sets up a launch agent that will attempt at 2am and 2:30am to download and/or install a pending software update via System Preferences.

## Why would you want to do this?
Well, honestly, the use case for this is probably quite narrow. If you have a desktop machine that's always on and isn't FileVault-encrypted, and you don't trust /usr/sbin/softwareupdate to install updates via script, you may want to try spsu to automate opening up System Preferences and installing pending macOS updates via the GUI.

## What are the pre-requisites for this?
Well, I've tested this on only macOS 10.15 (Catalina), so your mileage may vary for other versions of macOS. Also, since it requires Accessibility, you'll either have to manually drag the `/Library/Application\ Support/spsu/spsu.applescript` file and the `/usr/bin/osascript` binary to *System Preferences* > *Security & Privacy* > *Accessibility* (even then you'll still get prompts for access to System Events, which I don't think you can preemptively do through the GUI), or sign the `spsu.applescript` binary with your developer certificate and then use a PPPC profile to allow your UAMDM'ed Mac to have that codesigning info allowed for Accessibility and System Events (should work but haven't really tested this myself).