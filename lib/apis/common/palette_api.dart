import 'package:memont_v2/apis/dio.dart';
import 'package:memont_v2/models/palette_dto.dart';

class PaletteApi {
  static final dio = DioIn().dio;

  static Future<List<PaletteDto>?> getPalette() async {
    try {
      final res = await dio.get('/common/palette');
      final List<dynamic> responseData = res.data['result']['data'];
      final result = responseData.map((v) => PaletteDto.fromJson(v)).toList();
      return result;
    } catch (err) {
      print('palette 조회 에러: ${err.toString()}');
      return null;
    }
  }
}
