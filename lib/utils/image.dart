enum ImageEnums { kandillilogo, logo, pin }

extension ImageEnumExtensions on ImageEnums {
  String get getPath => "assets/images/$name.png";
}

// extension GetImage on Image {
//   String getPath(String pathName) => "assets/images/$pathName.png";
// }
