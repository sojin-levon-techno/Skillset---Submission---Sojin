
import 'package:flutter/material.dart';

class DragHandleWidget extends StatelessWidget {
  const DragHandleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
    );
  }
}
