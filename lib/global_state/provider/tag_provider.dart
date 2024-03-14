import 'package:flutter/material.dart';
import 'package:memont_v2/models/cursor_response.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';

class TagProvider extends ChangeNotifier {
  List<TagDto> _tagList = [];
  int? _cursor = 0;

  List<TagDto> get tagList => _tagList;
  int? get cursor => _cursor;

  set tag(CursorResponse<TagDto> cursorResponse) {
    _tagList = cursorResponse.data;
    _cursor = cursorResponse.cursor;
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
