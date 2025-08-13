import 'package:analyzer/dart/element/visitor2.dart';
import 'package:analyzer/dart/element/element.dart';

class ModelVisitor extends SimpleElementVisitor2<void> {
  String className = "RemoteDataSource";

  Map<String, dynamic> fields = {};
  Map<String, Map<dynamic, Map<String, dynamic>>> methods = {};
}
