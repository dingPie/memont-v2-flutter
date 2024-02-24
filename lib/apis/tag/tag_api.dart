import 'package:memont_v2/apis/dio.dart';
import 'package:memont_v2/models/delete_tag_dto/delete_tag_dto.dart';

import 'package:memont_v2/models/tag_dto/tag_dto.dart';

class TagApi {
  static final dio = DioIn().dio;

  static Future<List<TagDto>?> getList() async {
    try {
      final res = await dio.get('/tag');
      final List<dynamic> responseData = res.data['result']['data'];
      final result = responseData.map((v) => TagDto.fromJson(v)).toList();

      return result;
    } catch (err) {
      print('tag 목록 조회 에러: ${err.toString()}');
      return null;
    }
  }

  static void create(TagDto body) async {
    try {
      final res = await dio.post(
        '/tag/create',
        data: body.toJson(),
      );
      print('res: ${res.toString()}');
    } catch (err) {
      print('tag 목록 조회 에러: ${err.toString()}');
      return null;
    }
  }

  static void update(TagDto body) async {
    try {
      final res = await dio.patch(
        '/tag/update/${body.id ?? 0}',
        data: body.toJson(),
      );
      print('res: ${res.toString()}');
    } catch (err) {
      print('tag 목록 조회 에러: ${err.toString()}');
      return null;
    }
  }

  static void delete(DeleteTagDto body) async {
    try {
      final res = await dio.delete(
        '/tag/delete/${body.id}',
        data: body.toJson(),
      );
      print('res: ${res.toString()}');
    } catch (err) {
      print('tag 목록 조회 에러: ${err.toString()}');
      return null;
    }
  }
}
