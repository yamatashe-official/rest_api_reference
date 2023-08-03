# Rest API / Project Flavors / Dynamic Screen Display Reference

This project is mainly used as a reference on making external API calls. It is also used as a way to see how to setup project flavors for both IOS and Android.
Please read this file to understand how navigation of the project works.

## Build Modes

This project was build in VS Code.
There are several build modes that are present.

Currently there are 2 versions of the project:

> .com.sample.rest_api_reference.simpsonsviewer

> .com.example.rest_api_reference.wireviewer

Depending on which version of the application you want to run, you can pick accordingly. To do so, you can run either:

> flutter run --flavor simpsonsviewer -- (insert flutterMode)

> flutter run --flavor wireviewer -- (insert flutterMode)

Currently settings for Debug, Release, Profile modes are present for both Android and IOS. That being said, on some emulators, modes outside of the DEBUG mode do not work. This is mainly due to support with the individual emulator, NOT the code.

Each version of the application will pull from respective sources that were requested.
Specifically:

> .simpsonsviewer will pull from the http://api.duckduckgo.com/?q=simpsons+characters&format=json REST api.

> .wireviewer will pull from the http://api.duckduckgo.com/?q=the+wire+characters&format=json REST api.

Data is displayed the same regardless of which app flavor is chosen.

## Functionality

This application has support for both Portrait and Landscape viewing modes.
Since the provided instructions were not clear, I took some liberty in how information should be display on phone screens when in Landscape mode.

Styling the application was not a priority as this is mainly used for reference purposes.

As is, on screen sizes that are tablet and bigger, information is displayed on a side by side basis.
For screen sizes that are more phone like, while in portrait mode, the application displays a separate screen when tapping for more information. However while in landscape, information is displayed side by side.

There is also search functionality built into the application that allows you to search through the list of data, and show relevant entrees based on either a Name or Description match.

When bringing up details for a listing, the relevant Name, Description, and Image are provided. If an image is not present, a fallback image is provided.

## Testing

This application was tested on both Android and IOS devices.
