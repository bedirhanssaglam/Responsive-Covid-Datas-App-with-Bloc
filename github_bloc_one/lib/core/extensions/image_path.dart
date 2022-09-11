extension ImagePath on String {
  String get toSvg => "assets/icons/$this.svg";

  String get toPng => "assets/images/$this.png";
}
