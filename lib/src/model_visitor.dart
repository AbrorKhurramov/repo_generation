import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = "RemoteDataSource";

  Map<String, dynamic> fields = {};
  Map<String, Map<dynamic, Map<String, dynamic>>> methods = {};

  @override
  void visitConstructorElement(ConstructorElement element) {
    final elementReturnType = element.type.returnType.toString();
    className = elementReturnType.replaceFirst('*', '');
  }

  @override
  void visitFieldElement(FieldElement element) {
    final elementType = element.type.toString();
    fields[element.name] = elementType.replaceFirst('*', '');
  }

  @override
  void visitMethodElement(MethodElement element) {
    Map<String, dynamic> params = {};
    element.parameters.forEach((param) {
      params[param.name] = param.type.toString();
    });
    methods[element.name] = {element.returnType.toString(): params};
  }
}
