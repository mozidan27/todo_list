import 'package:hive_flutter/adapters.dart';

class MyPicDataBase {
  String pic = '';
  final _myPic = Hive.box("mypic");
  void createInitialPic() {
    pic = 'assets/images/avatar.png';
  }

  //load your image
  void loadImage() {
    pic = _myPic.get("MYPIC") ?? "assets/images/avatar.png";
  }

  // save image path
  void saveImagePath(String path) {
    _myPic.put("MYPIC", path);
    pic = path;
  }

  // update your image
  void updateImage() {
    _myPic.put("MYPIC", pic);
  }
}
