import 'package:memont_v2/apis/dio.dart';
import 'package:memont_v2/models/palette.dart';

class PaletteApi {
  var dio = DioIn().dio;

  Future<List<Palette>?> getPalette() async {
    try {
      final res = await dio.get('/common/palette');
      final List<dynamic> responseData = res.data['result'][
          'data']; // P_TODO: responseType 을 정하려면 class 기반 타입밖에 안나오는데, 이걸 어떻게 해결하지?
      final result = responseData.map((v) => Palette.fromJson(v)).toList();
      return result;
    } catch (err) {
      print('palette 조회 에러: ${err.toString()}');
      return null;
    }
  }
}
