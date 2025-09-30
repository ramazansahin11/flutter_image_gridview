import 'package:flutter/material.dart';

class SwitchLocalToRemote extends StatelessWidget {
  const SwitchLocalToRemote({
    super.key,
    required this.changeDataSource,
    required this.isActive,
  });
  final bool isActive;
  final void Function()? changeDataSource;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: changeDataSource,
      icon: isActive
          ? Icon(Icons.cloud, color: Colors.white)
          : Icon(Icons.cloud),
    );
  }
}
