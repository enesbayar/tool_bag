import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:tool_bag/models/widget_model/pages_widget_model.dart';
import 'package:tool_bag/screens/gallery_detail_page.dart';
import 'package:tool_bag/widgets/classic_text.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<AssetEntity> _galleryList = [];
  @override
  void initState() {
    super.initState();
    getDataFromGallery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClassicText(
          text: PagesWidgetModel.gallery,
          fontSize: 18,
        ),
      ),
      body: buildGallery(),
    );
  }

  Widget buildGallery() {
    return GridView.builder(
        itemCount: _galleryList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return FutureBuilder(
            future: _galleryList[index].thumbDataWithSize(400, 400),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData)
                return Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Hero(
                    tag: snapshot.data,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GalleryDetailPage(snapshot.data))),
                      child: Image.memory(
                        snapshot.data,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              return CircularProgressIndicator();
            },
          );
        });
  }

  void getDataFromGallery() async {
    bool isAllowed = await PhotoManager.requestPermission();
    if (isAllowed) {
      List<AssetPathEntity> gallery =
          await PhotoManager.getAssetPathList(onlyAll: true);
      List<AssetEntity> galleryItem =
          await gallery[0].getAssetListPaged(0, 100);
      setState(() {
        _galleryList = galleryItem;
      });
    } else {
      PhotoManager.openSetting();
    }
  }
}
