import 'package:flutter/material.dart';

class CustomConditionalBuilder extends StatelessWidget {
  final bool successCondition;
  final WidgetBuilder builder;
  final WidgetBuilder? fallBack;

  const CustomConditionalBuilder({
    super.key,
    required this.successCondition,
    required this.builder,
    this.fallBack,
  });

  @override
  Widget build(BuildContext context) {
    if (!successCondition && fallBack != null) {
      return fallBack!(context);
    }
    if (successCondition) {
      return builder(context);
    }
    return const SizedBox.shrink();
  }
}
