import 'package:flutter/material.dart';
import 'package:rest_api_reference/models/CharacterModel.dart';

class DataProvider with ChangeNotifier {
  List<CharacterModel> characters = [];
  CharacterModel? selectedCharacter;

  //update the characters with new data provided from API call
  set updateCharacters(List<CharacterModel> newCharacters) {
    characters = newCharacters;
    notifyListeners();
  }

  //update the selected character with new selection when user decided to tap on specific character element
  set updateSelectedCharacter(CharacterModel? newCharacter) {
    selectedCharacter = newCharacter;
    notifyListeners();
  }
}
