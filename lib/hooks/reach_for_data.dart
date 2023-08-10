import 'dart:convert';
import 'package:http/http.dart';
import '../flavors_config.dart';
import '../models/CharacterModel.dart';
import '../providers/data_provider.dart';

Future<void> reachForData({required DataProvider dp, required FlavorsConfig fc}) async {
  // make api call here to server -
  // split data based on result
  //below - change the url to call specific url based on application ID
  Response receivedData = await get(Uri.parse(fc.apiEndpoints!["apiDataRepo"]!));
  if (receivedData.statusCode == 200) {
    // print("success");
    Map<String, dynamic> dataHolder = jsonDecode(receivedData.body);
    dp.updateCharacters = dataHolder["RelatedTopics"].map<CharacterModel>((e) => CharacterModel.fromJson(e)).toList();
  } else {
    // print("something went wrong");
    dp.updateCharacters = [];
  }
}
