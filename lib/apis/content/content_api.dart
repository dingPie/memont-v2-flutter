import 'package:memont_v2/apis/dio.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/models/cursor_response.dart';
import 'package:memont_v2/models/get_content_dto/get_content_dto.dart';

class ContentApi {
  static final dio = DioIn().dio;

  static Future<CursorResponse<ContentDto>?> getListByCursor(
      GetContentDto getContentDto) async {
    try {
      final res = await dio.get(
        '/content/by-cursor',
        queryParameters: getContentDto.toJson(),
      );
      final List<dynamic> responseData = res.data['result']['data'];
      int? cursor = res.data['result']['cursor'];

      final contentList =
          responseData.map((v) => ContentDto.fromJson(v)).toList();
      var result = CursorResponse<ContentDto>(
        data: contentList,
        cursor: cursor,
      );

      return result;
    } catch (err) {
      print('content 목록 조회 에러: ${err.toString()}');
      return null;
    }
  }

  static Future<ContentDto?> createMemo(ContentDto body) async {
    try {
      final res = await dio.post(
        '/content/create/memo',
        data: body.toJson(),
      );
      final dynamic responseData = res.data['result']['data'];
      print('RES: ${ContentDto.fromJson(responseData)}');
      return ContentDto.fromJson(responseData);
    } catch (err) {
      print('content 생성 에러: ${err.toString()}');
      return null;
    }
  }

  static void update(ContentDto body) async {
    try {
      final res = await dio.patch(
        '/content/update/${body.id ?? 0}',
        data: body.toJson(),
      );
      print('res: ${res.toString()}');
    } catch (err) {
      print('content 수정 에러: ${err.toString()}');
      return null;
    }
  }

  static void toggleToBeDeleted(List<int> body) async {
    try {
      final res = await dio.patch(
        '/content/toggle-to-be-deleted',
        data: {
          'idList': body,
        },
      );
      print('res: ${res.toString()}');
    } catch (err) {
      print('content 수정 에러: ${err.toString()}');
      return null;
    }
  }

  static void delete(int id) async {
    try {
      final res = await dio.delete(
        '/content/delete/$id',
      );
      print('res: ${res.toString()}');
    } catch (err) {
      print('content 목록 조회 에러: ${err.toString()}');
      return null;
    }
  }
}
