# Text Field
Text Field is an egg that helps Sketch design get converted into the Flutter code implementation of a [TextField](https://api.flutter.dev/flutter/material/TextField-class.html) 

## Design Protocol / Usage
Documentation on the general Parabac designer docs is available [here](https://docs.parabeac.com/plugins/dealing-with-plugins/).

**Semantic**: <`text-field`>

**Subsemantics**:
* <`label-text`>
   * Maps to the `labelText` property within the Text Field.
* <`icon`>
   * Maps to the `icon` image that is leading the Text Field.
* <`number`>
   * Sets the keyboard type to `number` when using the Text Field.
* <`email`>
   * Sets the keyboard type to `email` when using the Text Field.
* <`date`>
   * Sets the keyboard type to `date` when using the Text Field.
* <`password`>
   * Sets the keyboard type to obscure the `text` when using the Text Field.
   
**Design Usage**
Set up the Text Field like the following:
![app_bar_sketch](https://github.com/Parabeac/parabeac_eggs/blob/master/internal_eggs/text_field/images/Text-Field_Sketch.png)

First group the elements of the Text Field into a group. Then you will have to add the `.*text-field` semantic to the name of the group. 

If you want to add a labelText within the Text Field you will want to add a `.*label-text` semantic to the text element in Sketch.If you want to add an icon leading the Text Field add a `.*icon` semantic to the element you are using as an icon.

Finally you are able to change the type of keyboard that appears for the Text Field. Just add one of the following semantics: `.*number`, `.*email`, `.*date`, `.*password`. Add the semantic to the rectangle element in the Text Field group as shown in the image above. 

The number keyboard adds a keypad as a keyboard. The email keyboard adds the @ symbol to the normal text keyboard. The date keyboard adds functionalities to write the date and time to the keyboard such as : and /. Finally the password keyboard is a normal keyboard, but will obscure the text in the textfield as you type it.

## How to install into Parabeac-Core

Download this folder, grab the app_bar.dart file & import into the plugins folder inside of the [Parabeac-Core](https://github.com/Parabeac/Parabeac-Core) project at `parabeac-core/lib/plugins/`
