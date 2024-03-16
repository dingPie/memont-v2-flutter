import 'package:memont_v2/apis/dio.dart';
import 'package:memont_v2/models/cursor_response.dart';
import 'package:memont_v2/models/delete_tag_dto/delete_tag_dto.dart';
import 'package:memont_v2/models/get_tag_dto/get_tag_dto.dart';

import 'package:memont_v2/models/tag_dto/tag_dto.dart';

class TagApi {
  static final dio = DioIn().dio;

  static Future<CursorResponse<TagDto>?> getListByCursor(
      GetTagDto getTagDto) async {
    try {
      final res = await dio.get(
        '/tag/by-cursor',
        queryParameters: getTagDto.toJson(),
      );
      final List<dynamic> responseData = res.data['result']['data'];
      int? cursor = res.data['result']['cursor'];
      final tagList = responseData.map((v) => TagDto.fromJson(v)).toList();

      var result = CursorResponse<TagDto>(
        data: tagList,
        cursor: cursor,
      );

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
