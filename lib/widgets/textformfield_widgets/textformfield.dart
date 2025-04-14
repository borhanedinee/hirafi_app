import 'package:flutter/material.dart';

class TextformFieldWidget extends StatelessWidget {
  TextEditingController textEditingController;
  TextformFieldWidget({
    required this.textEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
    );
  }
}

              