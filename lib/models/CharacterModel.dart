import 'IconModel.dart';

class CharacterModel {
  final String? FirstUrl, Result, Text, Name, Description, ImageUrl;
  final IconModel? Icon;

  const CharacterModel({
    this.FirstUrl,
    this.Result,
    this.Text,
    this.Icon,
    this.Name,
    this.Description,
    this.ImageUrl,
  });

  //converts a Map<String,dynamic> object into a CharacterModel object
  //uses factory constructor - allows to call an instance of current class
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      FirstUrl: json["FirstURL"],
      Result: json["Result"],
      Text: json["Text"],
      Name: json["Text"].split(" - ").first,
      Description: json["Text"].split(" - ").last,
      ImageUrl: json["Icon"]["URL"] != "" ? "https://duckduckgo.com${json["Icon"]["URL"]}" : null,
      Icon: IconModel.fromJson(json["Icon"]),
    );
  }
}
