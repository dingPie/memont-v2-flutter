import 'package:memont_v2/apis/dio.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/models/cursor_response.dart';
import 'package:memont_v2/models/get_content_dto/get_content_dto.dart';

class ContentApi {
  static final dio = DioIn().dio;

  /// cursor pagination 기반 콘텐츠 목록 불러오기
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

  /// 메모 생성
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

  /// 메모 수정
  static Future<ContentDto?> update(ContentDto body) async {
    try {
      final res = await dio.patch(
        '/content/update/${body.id ?? 0}',
        data: body.toJson(),
      );
      final dynamic responseData = res.data['result']['data'];
      print('RES: ${ContentDto.fromJson(responseData)}');
      return ContentDto.fromJson(responseData);
    } catch (err) {
      print('content 수정 에러: ${err}');
      return null;
    }
  }

  /// 삭제예정 토글
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

  /// 콘텐츠 삭제
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

  /// 핀 콘텐츠 조회
  static Future<ContentDto?> getPinContent() async {
    try {
      final res = await dio.get('/content/pin');
      final dynamic responseData = res.data['result']['data'];

      ContentDto result = ContentDto.fromJson(responseData);

      return result;
    } catch (err) {
      print('pin content 조회 에러: ${err.toString()}');
      return null;
    }
  }

  /// 핀 콘텐츠 수정
  static Future<ContentDto?> patchPinContent(int? contentId) async {
    try {
      final res = await dio.patch(
        '/content/pin',
        data: {
          'contentId': contentId,
        },
      );

      final dynamic responseData = res.data['result']['data'];

      ContentDto? result =
          responseData == null ? null : ContentDto.fromJson(responseData);

      return result;
    } catch (err) {
      print('content pin 에러: ${err.toString()}');
      return null;
    }
  }
}
