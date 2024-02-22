import 'package:flutter/material.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';

class TagProvider extends ChangeNotifier {
  List<TagDto> _tagList = [];

  List<TagDto> get tagList => _tagList;

  set tagList(List<TagDto> tagList) {
    _tagList = tagList;
    notifyListeners();
  }

  void add(TagDto tag) {
    _tagList.add(tag);
    notifyListeners();
  }

  void remove(int tagId) {
    _tagList.removeWhere((ele) => tagId == ele.id);
    notifyListeners();
  }

  TagProvider();
}
