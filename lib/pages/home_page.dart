import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<StaggeredGridTile> images = [
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 2,
      child: Image.asset("assets/images/image1.jpg", fit: BoxFit.cover),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Image.asset("assets/images/image2.jpg", fit: BoxFit.cover),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Image.asset("assets/images/image3.jpg", fit: BoxFit.cover),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 2,
      child: Image.asset("assets/images/image4.jpg", fit: BoxFit.cover),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Image.asset("assets/images/image5.jpg", fit: BoxFit.cover),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Image.asset("assets/images/image6.jpg", fit: BoxFit.cover),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 2,
      child: Image.asset("assets/images/image7.jpg", fit: BoxFit.cover),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Image.asset("assets/images/image8.jpg", fit: BoxFit.cover),
    ),
    StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,

      child: Image.asset("assets/images/image9.jpg", fit: BoxFit.cover),
    ),
  ];

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isActive = !isActive;
                    });
                  },
                  icon: isActive
                      ? Icon(Icons.cloud, color: Colors.white)
                      : Icon(Icons.cloud),
                ),
              ],
              backgroundColor: Colors.transparent,
            ),
          ];
        },
        body: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: images,
          ),
        ),
      ),
    );
  }
}
