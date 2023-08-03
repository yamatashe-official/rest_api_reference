class IconModel {
  final String? Height, Width, Url;
  const IconModel({
    this.Height,
    this.Width,
    this.Url,
  });

  //converts a Map<String,dynamic> object into a IconModel object
  //uses factory constructor - allows to call an instance of current class
  factory IconModel.fromJson(Map<String, dynamic> json) {
    return IconModel(
      Height: json["Height"],
      Width: json["Width"],
      Url: json["URL"],
    );
  }
}
