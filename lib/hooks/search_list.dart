import 'package:flutter/material.dart';
import '../models/CharacterModel.dart';
import '../providers/data_provider.dart';

List<CharacterModel> searchList({required DataProvider dp, required TextEditingController searchController}) {
  if (searchController.text != "") {
    return dp.characters.where((element) => element.Text?.toLowerCase().contains(searchController.text.toLowerCase()) ?? false).toList();
  } else {
    return [];
  }
}
