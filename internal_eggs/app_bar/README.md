# App Bar
App Bar is an egg that helps designs convert directly to the Flutter implementation of [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

## Design Protocol / Usage
Documentation on the designer docs is available [here](https://docs.parabeac.com/plugins/dealing-with-plugins/how-to-create-a-navigation-bar-and-tab-bar).

**Semantic**: <`appbar`>

**Subsemantics**:
* <`leading`>
   * Maps to the `leading` property.
* <`middle`>
   * Maps to the `middle` property.
* <`traling`>
   * Maps to the `trailing` property.
   
  
**Design Usage**
To set up a Navigation Bar like the following:
![app_bar_sketch](https://github.com/Parabeac/parabeac_eggs/blob/master/internal_eggs/app_bar/images/appbar_sketch.png)

You will want to group your navigation bar into a group. You will then add `.*navbar` to the name of that group.
As described above, to set the 3 locations of the items in the nav bar, you can use `.*leading`, `.*middle` and `.*trailing`.

## How to install into Parabeac-Core

Download this folder, grab the app_bar.dart file & import into the plugins folder inside of the [Parabeac-Core](https://github.com/Parabeac/Parabeac-Core) project at `parabeac-core/lib/plugins/`

## Example Code Export
TODO:
