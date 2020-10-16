Parabeac eggs are plugins that were created to enable developers to create custom implementations for the way a design element converts to Flutter code. Implementation is triggered through the use of naming semantics.

## What are Parabeac Eggs
Parabeac eggs allow developers and designers to implement custom flutter code generation within Parabeac Core by expanding on the base set of Parabeac Design Protocol Semantics. In order to understand how this works all a developer or designer has to understand are the following two things:
1. Parabeac Design Protocol & Semantics
2. The basics of Code Generation within Parabeac Core

### Parabeac Design Protocol & Semantics 
The Parabeac Design Protocol is a set of specified design semantics that help define design elements or groups of design elements so that Parabeac Core can get additional context on what Widgets and Attributes it needs to generate. A semantic is simply a tag or signifier added to the name of an element or group to give to signify what it is. A semantic can look like ``` .*background``` or ``` .*h-scrollview``` and is simply used to help identify what an element is. 

### Code Generation within Parabeac Core
One of the primary phases of Parabeac Core is the generation of the Flutter Project itself. Within this phase Parabeac Core is able to use semantics, as discussed above, to make more intellegent decisions about which widgets and which attributes are being generated. Parabeac Core can then generate the specific widgets and attributes as noted by the semantics. 

### How do Parabeac Eggs Fit in
All a Parabeac Egg does is introduce a new semantic into the Parabeac Design Protocol and connect that semantic with the appropriate generation in Parabeac Core. Thats it. By extending the appropriate Parabeac Core Plug-in classes new semantics and their respective code can easily be added into Parabeac Core allowing for a number of custom code generation and add-ons.

### Creating Eggs
To create an egg, head over to the [parabeac_egg_template repo](https://github.com/Parabeac/parabeac-egg-template).

Below is a list of parabeac developed eggs & community developed eggs. Some eggs like `tab_bar` rely on sub eggs like tab. We currently don't support automatic dependency downloads so if you see an egg that has a sub egg, you'll have to install it manually. You can learn how to install an egg __here__. If you'd like to add your egg to this repo, make a PR! 

 * [App Bar](https://github.com/Parabeac/parabeac_eggs/tree/master/internal_eggs/app_bar)
 * [Tab Bar](https://github.com/Parabeac/parabeac_eggs/tree/master/internal_eggs/tab_bar)
   * [Tab](https://github.com/Parabeac/parabeac_eggs/tree/master/internal_eggs/tab)
 * [Date Picker](https://github.com/Parabeac/parabeac_eggs/tree/master/internal_eggs/date_picker)
 * [Text Field](https://github.com/Parabeac/parabeac_eggs/tree/master/internal_eggs/text_field)



We are working on creating a full marketplace for eggs but in the meantime, please bear with us & feel free to send us any feedback you may have!!!
