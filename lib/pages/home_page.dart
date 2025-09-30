import 'package:flutter/material.dart';
import 'package:flutter_image_gridview/data/local_data_source.dart';
import 'package:flutter_image_gridview/data/remote_data_source.dart';
import 'package:flutter_image_gridview/widgets/local_stagered_grid_view_widget.dart';
import 'package:flutter_image_gridview/widgets/switch_local_to_remote.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isActive = false;

  Future<List<StaggeredGridTile>> loadRemoteImages(BuildContext context) async {
    final tiles = <StaggeredGridTile>[];

    for (var i = 0; i < remoteImageUrls.length; i++) {
      final url = remoteImageUrls[i];
      await precacheImage(NetworkImage(url), context); // Önceden belleğe yükle

      tiles.add(
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: (i % 3 == 0)
              ? 2
              : 1, // örnek olarak farklı yükseklik
          child: Image.network(url, fit: BoxFit.cover),
        ),
      );
    }

    return tiles;
  }

  Future<void> changeDataSource() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      isActive = !isActive; // toggle
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                SwitchLocalToRemote(
                  isActive: isActive,
                  changeDataSource: changeDataSource,
                ),
              ],
              backgroundColor: Colors.transparent,
            ),
          ];
        },
        body: FutureBuilder<List<StaggeredGridTile>>(
          future: isActive
              ? loadRemoteImages(context)
              : Future.value(localimages),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Hata: ${snapshot.error}"));
            }
            return LocalStageredGridViewWidget(images: snapshot.data!);
          },
        ),
      ),
    );
  }
}
