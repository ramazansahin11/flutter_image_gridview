import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LocalStageredGridViewWidget extends StatelessWidget {
  const LocalStageredGridViewWidget({super.key, required this.images});
  final List<StaggeredGridTile> images;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: images,
      ),
    );
  }
}
