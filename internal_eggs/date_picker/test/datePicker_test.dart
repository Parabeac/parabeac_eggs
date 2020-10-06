import 'package:MyPlugin/my_generator.dart';
import 'package:MyPlugin/my_plugin.dart';
import 'package:test/test.dart';

void main() {
  MyPlugin plugin = MyPlugin();
  expect(plugin.semanticName, !null);
  expect(plugin.runtimeType, PluginNode);
}
