import 'package:memont/apis/dio.dart';

class PaletteApi {
  var dio = DioIn().dio;

  getPalette() async {
    try {
      var result = await dio.get('/common/palette');
      print("결과확인! ${result.data.toString()}");
    } catch (err) {
      print('palette 조회 에러: ${err.toString()}');
    }

    // P_TODO: model에 넣는 등 로직 필요, 그리고 반환
  }
}
