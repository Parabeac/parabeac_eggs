import 'package:parabeac_core/design_logic/design_node.dart';
import 'package:parabeac_core/generation/generators/pb_generator.dart';
import 'package:parabeac_core/generation/generators/plugins/pb_plugin_node.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/interfaces/pb_inherited_intermediate.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/interfaces/pb_injected_intermediate.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/subclasses/pb_intermediate_node.dart';
import 'package:parabeac_core/interpret_and_optimize/helpers/pb_context.dart';
import 'package:parabeac_core/interpret_and_optimize/value_objects/point.dart';

import '../interpret_and_optimize/helpers/pb_context.dart';

class Textfield extends PBEgg implements PBInjectedIntermediate {
  
  Textfield(Point topLeftCorner, Point bottomRightCorner, this.UUID,
      {this.currentContext})
      : super(topLeftCorner, bottomRightCorner, currentContext) {
   
    generator = TextfieldGenerator(widgetType);
  }

  var labelText;
  var icon;
  var keyboardType;

  PBContext currentContext;
  final String UUID;

  String widgetType = 'TextField';
  String semanticName = '.*text-field';

  @override
  void addChild(PBIntermediateNode node) {
    if (node is PBInheritedIntermediate) {
      if ((node as PBInheritedIntermediate)
        .originalRef
        .name
        .contains('.*label-text')) {
          labelText = (node as PBInheritedIntermediate).originalRef.attributedString['string'];
      }

      if ((node as PBInheritedIntermediate)
        .originalRef
        .name
        .contains('.*icon')) {
          icon = (node as PBInheritedIntermediate).originalRef.UUID;
      }

      if ((node as PBInheritedIntermediate)
        .originalRef
        .name
        .contains('.*number')) {
          keyboardType = 1;
      }

      if ((node as PBInheritedIntermediate)
        .originalRef
        .name
        .contains('.*email')) {
          keyboardType = 2;
      }

      if ((node as PBInheritedIntermediate)
        .originalRef
        .name
        .contains('.*date')) {
          keyboardType = 3;
      }

      if ((node as PBInheritedIntermediate)
        .originalRef
        .name
        .contains('.*password')) {
          keyboardType = 'password';
      }
      
    }
    return;
  }

  @override
  void alignChild() {}

  @override
  void extractInformation(DesignNode incomingNode) {}

  @override
  PBEgg generatePluginNode(
      Point topLeftCorner, Point bottomRightCorner, DesignNode originalRef) {
    return Textfield(topLeftCorner, bottomRightCorner, UUID,
        currentContext: currentContext);
  }
}

class TextfieldGenerator extends PBGenerator {
  TextfieldGenerator(String widgetType);

  @override
  String generate(PBIntermediateNode source) {
    if (source is Textfield) {
      
      var buffer = StringBuffer();
      buffer.write('TextField(');
      if(source.icon != null || source.labelText != null) {
        buffer.write('decoration: InputDecoration(');
        if(source.icon != null) {
          buffer.write('icon: ImageIcon( AssetImage(\'assets/images/${source.icon}.png\')),');
        }
        if(source.labelText != null) {
          buffer.write('labelText: \'${source.labelText}\'');
        }
        buffer.write('),');
      }
      if(source.keyboardType != null) {
        if(source.keyboardType != 'password') {
          buffer.write('keyboardType: ');
          switch (source.keyboardType) {
            case 1: {
                buffer.write('TextInputType.number,');
              }
              break;
            case 2: {
                buffer.write('TextInputType.emailAddress,');
              }
              break;
            case 3: {
                buffer.write('TextInputType.datetime,');
              }
              break;
          }
        } 
        buffer.write('obscureText: true,');
      }
      buffer.write('onSubmitted: (text) {}');
      buffer.write(')');
      return buffer.toString();
    }
  }
}