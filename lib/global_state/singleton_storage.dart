// P_MEMO: 상수값을 저장하기 위한 SingletonStorage. widget단에서 쓰지 않기 떄문에 따로 관리중임.
// 해당 구조는 변경될 수 있음
// /
import 'package:memont_v2/models/palette_dto.dart';

final class SingletonStorage {
  String? accessToken;
  List<PaletteDto>? paletteList;

  SingletonStorage._();
  // private 생성자로 정의한 생성자를 static 영역에 할당해버린다.
  static final SingletonStorage _instance = SingletonStorage._();

  // 실제로 instance 생성시, instance를 반환하는 factory 패턴에 따라 static 영역에 할당된 instance가 그대로 반환된다. (생성되지 않는다.)
  factory SingletonStorage() {
    return _instance;
  }

  // set paletteList(List<Palette> list) => _paletteList = list;
}
