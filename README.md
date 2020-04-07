# Sys Pref Software Update (spsu)

## Important note
At this point, spsu is more of a *proof-of-concept* than an actual viable project that's fully fleshed out and recommended.

## What does this do?
This sets up a launch agent that will attempt at 2am and 2:30am to download and/or install a pending software update via System Preferences.

## Why would you want to do this?
Well, honestly, the use case for this is probably quite narrow. If you have a desktop machine that's always on and isn't FileVault-encrypted, and you don't trust /usr/sbin/softwareupdate to install updates via script, you may want to try spsu to automate opening up System Preferences and installing pending macOS updates via the GUI.

Note: I did some light testing, and it appears this _may_ even work on a FileVault-encrypted Mac. I haven't done extensive testing on this, though, so your mileage may vary a lot.

## Why does the launch agent run this twice?
Even when your Mac sees an update available, it doesn't necessarily download that update in the background, so clicking *Update Now* may present *Download & Restart* or present *Restart*. In theory, clicking *Download & Restart* prompts a *Restarting Your Computer: Your computer will restart in 60 seconds to install updates* banner notification with a countdown to an automated restart, but the second run will initiate the restart if that doesn't happen (or do nothing if it does).

## What are the pre-requisites for this?
### macOS version
Well, I've tested this on only macOS 10.15 (Catalina), so your mileage may vary for other versions of macOS.

### Permissions
#### Manually granted
Also, since it requires Accessibility, you'll have to manually drag the `/Library/Application\ Support/spsu/spsu.applescript` file and the `/usr/bin/osascript` binary to *System Preferences* > *Security & Privacy* > *Accessibility* (even then you'll still get prompts for access to System Events, which I don't think you can preemptively do through the GUI in the Automation section).

That said, in theory, if you manually run `/Library/Application\ Support/spsu/spsu.applescript` once and then manually approve System Events once, that approval should hold for future automated runs.

#### Granted via UAMDM and PPPC profile
Another option _in theory_ would be to sign the `spsu.applescript` binary with your developer certificate and then use a PPPC profile to allow your UAMDM'ed Mac to have that codesigning info allowed for Accessibility and System Events (should work but haven't really tested this myself).

I've tested this myself, and I can't get it to work, even with allowing System Events and Accessibility to both `spus.applescript` and `osascript`.

### Creating a .pkg
This is set up to be made into a .pkg using [munkipkg](https://github.com/munki/munki-pkg)
