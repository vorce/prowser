# prowser

Prowser is a small utility for MacOS which makes sure you open links in the browser of your choice.
For example: Open all links clicked in Slack in Firefox, but all links from Skype in Chrome.

## Limitations

## Build and run

I have yet to publish this to the App store (or anywhere else really) - so you need to build this yourself. Here's how:

1. Open the project in Xcode
2. Click on the `Product` -> `Archive` menu item
3. Click "Export..."
4. Chose "Export as a Mac Application"

This should generate a `prowser.app` ready to be run.

## TODO

- Remove unused code
- Make it possible to define rules in Prefernces
    - Everything from app Skype -> Browser A
    - Everything with url *gmail* -> Browser B

