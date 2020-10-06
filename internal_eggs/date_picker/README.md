# Parabeac-Egg-Template
Parabeac eggs are plugins that were created to enable developers to have custom implementations for the way a design element converts to Flutter code. This repo Parabeac-egg-template is a template to quickly get a developer going on creating an egg.

## What are Parabeac Eggs
To learn what Parabeac eggs are, visit the [parabeac_eggs](https://github.com/Parabeac/parabeac_eggs) repo.

## Getting started

1. Clone Parabeac-Core
```
git clone --recurse-submodules https://github.com/Parabeac/Parabeac-Core.git
```
2. Clone this repo
```
git clone https://github.com/Parabeac/Parabeac-egg-template.git
```
3. Move the `my_egg.dart` file into the plugins folder inside of the Parabeac-Core project at `/parabeac-core/lib/plugins/`

4. Edit your custom egg.

# Customizing your egg

The egg file is made up of two classes.
* PBEgg
   * This is the class that overrides Parabeac-Core's **Intermediate nodes** for the set semantic name expected for this egg.
* PBGenerator
   * This is the class that converts the corresponding egg into Flutter code.

![egg process](https://kindling-sketch.s3.amazonaws.com/eggs_demo.gif)

## How do Eggs fit in the Parabeac-Core Process

1. Design files get converted into Parabeac Design Nodes. These nodes contain the necessary semantics that are needed to detect for Parabeac Eggs.

2. Design Nodes will get converted into regular intermediate nodes while nodes detected as eggs will get converted into eggs.

3. Regular intermediate nodes get processed and converted into Flutter code by the regular process while eggs are able to control how they are handled almost entirely.

This Repository hosts a sample Parabeac Egg template that can be used to kick start the development of your egg or just give more clarity and guidance on how Parabeac Eggs work. In order to get going with Parabeac Eggs just clone the repository and you're good to go.

There are a couple of things to keep in mind while developing your egg.

1. Make sure you have a semantic for your egg, it could be anything; make sure to communicate the semantic with the designer.
2. Make sure you are extending the egg class.
3. Finally, place your egg in the plugins directory inside of Parabeac Core.  (`/Parabeac-Core/lib/plugins`)
4. Below is how to utilize each function available for the PBEgg & PBGenerator classes.

## Egg Functions & Capabilities

`void addChild(PBIntermediateNode node)` -

This function is used to add a child to this node. You can ignore the child or children coming in or you can add it to the child property like this:
```
void addChild(PBIntermediateNode node){
  this.child = node;
}
```

`void alignChild()` -

This function is used to add alignment to this node. Many classes when exported to Flutter have default alignment which makes the normal alignment to work correctly. However in most cases you should be able to use the default 

```
void alignChild(){
  /// For one to one alignment.
  var align = InjectedAlign(topLeftCorner, bottomRightCorner, currentContext);
  align.addChild(child);
  align.alignChild();
  child = align;
}
```

`void extractInformation(DesignNode incomingNode)` -
This is the first method that gets executed immediately after the egg being discovered as an egg. Here you can pull out any information you need from the design node that you might need for the egg.

`PBEgg generatePluginNode(Point topLeftCorner, Point bottomRightCorner, DesignNode originalRef)` -
Here you simply want to return the generator you would like to use to convert this egg into Flutter code.

## Generator Functions & Capabilities

`String generate(PBIntermediateNode source)` -
This is the method to generate the Flutter code that should be injected. Below is a sample.
```
  var buffer = StringBuffer();
  buffer.write('Container(');
  buffer.write(')');
  return buffer.toString();
```

From the generator you have access to the manager. Access to the manager gives you access to the following methods that can be used within the generate() method.
```
 /// Declares a parameter that is used to declare an instance variable and contructor parameter in the manager.
 /// PBParam accepts 3 values: Name of the variable, type of the variable, & the default value of the variable.
 var value = PBParam('switchValue', 'bool', false);

 /// Notifying the manager to add an instance variable to the file.
 manager.addInstanceVariable(value);
      
 /// Notifying the manager to inject a contstructor variable to the constructor to override the default value if wanted.
 manager.addConstructorVariable(value);
      
 /// Notifying the manager to inject a package dependency into the pubspec.yaml file of the exported project.
 manager.addDependencies('list_tile_switch', '^0.0.2');
      
 /// Notifying the manager to inject an import into the file.
 manager.addImport('package:list_tile_switch/list_tile_switch.dart');
```
* If you wanted to add an instance variable or state variable, you can create a `PBParam` and send it to `.addInstanceVariable()`
* You can also make this variable accessible from the constructor by calling add the same PBParam to `.addConstructorVariable()`
* If you wanted to use a 3rd party dependency from pub.dev, you can inject that using `.addDependencies()`.
* If you need to import a file into the top of the dart file for the class this egg is going to be in, you can add the import string by using `.addImport()`

After this, you can run Parabeac Core and watch your egg do its magic!
