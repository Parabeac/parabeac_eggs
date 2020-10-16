  
import 'package:parabeac_core/design_logic/design_node.dart';
import 'package:parabeac_core/generation/generators/pb_flutter_generator.dart';
import 'package:parabeac_core/generation/generators/pb_generator.dart';
import 'package:parabeac_core/generation/prototyping/pb_prototype_node.dart';
import 'package:parabeac_core/input/sketch/entities/layers/abstract_group_layer.dart';
import 'package:parabeac_core/input/sketch/entities/layers/symbol_instance.dart';
import 'package:parabeac_core/input/sketch/entities/layers/symbol_master.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/interfaces/pb_injected_intermediate.dart';
import 'package:parabeac_core/generation/generators/plugins/pb_plugin_node.dart';
import 'package:parabeac_core/interpret_and_optimize/entities/subclasses/pb_intermediate_node.dart';
import 'package:parabeac_core/interpret_and_optimize/helpers/pb_context.dart';
import 'package:parabeac_core/interpret_and_optimize/value_objects/point.dart';
import 'package:uuid/uuid.dart';

class InjectedDatePicker extends PBEgg implements PBInjectedIntermediate {
  final String UUID;
  PBContext currentContext;
  String semanticName = '.*button.date-picker';

  String widgetType = 'DatePicker';

  InjectedDatePicker(
    Point topLeftCorner,
    Point bottomRightCorner,
    this.UUID, {
    this.currentContext,
  }) : super(topLeftCorner, bottomRightCorner, currentContext) {
    generator = PBTabBarGenerator();
  }

   @override
  void addChild(PBIntermediateNode node) {
    return;
  }

  @override
  void alignChild() {}

  @override
  PBEgg generatePluginNode(
      Point topLeftCorner, Point bottomRightCorner, originalRef) {
    return InjectedDatePicker(topLeftCorner, bottomRightCorner, UUID,
        currentContext: currentContext);
  }

  @override
  List<PBIntermediateNode> layoutInstruction(List<PBIntermediateNode> layer) {
    return layer;
  }

  @override
  void extractInformation(DesignNode incomingNode) {}

}

class PBDatePickerGenerator extends PBGenerator {
  PBDatePickerGenerator() : super('AppBar');

  @override
  String generate(PBIntermediateNode source) {
    if (source is InjectedNavbar) {
      var buffer = StringBuffer();

      buffer.write(
        'IconButton(icon:Icon(Icons.calendar_today),onPressed : () {showDatePicker(context: context,initialDate: DateTime.now(),firstDate: DateTime(2000),lastDate: DateTime(2025),)}'
      );
      return buffer.toString();
    }
  }
}