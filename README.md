# iOS-LocalisedCities-Demo
This repo is a demo of how to use geographic coordinates to show **localised** country and city names for those coordinates in iOS using Swift.

## What this demo does
This demo is a simple Swift iOS app showing a **localised** list of cities in a table view produced by a list of coordinates of those cities. 
Table view items have format `City Name, Country Name` in a language currently set in iOS device's Settings App.

## How does this work
Firstly, we create `CLLocation` objects by providing latitude and longitude for a city. 
Secondly, we create a `CLGeocoder` object and use it's `reverseGeocodeLocation` to get an array of `CLPlacemark` objects. Placemark objects include information such as the country, state, city, and street address associated with the specified coordinate. It can also include points of interest and geographically related data. 

We use `locality` property of `CLPlacemark` to get localised city name, and `country` property of `CLPlacemark` to get localised country name.

Please note, that you need to add **CoreLocation** framework to your project before using `CLGeocoder`, `CLLocation` and `CLPlacemark`.

## Example
Let's use Stockholm as an example.

With **English** language set on device it will be shown as `Stockholm, Sweden`.  
With **Russian** language set on device it will be shown as `Стокгольм, Швеция`.  
With **Swedish** language set on device it will be shown as `Stockholm, Sverige`.  

## How to change device language
Go to `Settings app` -> `General` -> `Language & Region` -> `iPhone Language`. 
City and country names in the demo app will be displayed in the languaged selected there. 
Unless you are running the app in the simulator.

## Special case: Simulator
In Simulator **both** city and country name would be displayed not in the selected in Settings app language, but **in language on the country, specified by the coordinates**. For example, `Copenhagen` will be always shown as `København` in spite of the English language selected because it is the Danish name of `Copenhagen`.

## Some cities are not localised!
It seems like `CLGeocoder`'s `reverseGeocodeLocation` does not always work properly with **city names** for some languages. 
In this demo you are highly likely to see `København` instead of `Копенгаген` using Russian language selected on your device. 
Similarly `Helsinki` is displayed as `Helsinki` instead of `Helsingfors` with Swedish language selected. 
The reason of this behaviour is unknown for me.

**Country names** produced in this way, however, seem to be always localised correctly.
