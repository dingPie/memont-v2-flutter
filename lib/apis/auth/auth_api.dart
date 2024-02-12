import 'package:memont_v2/apis/dio.dart';
import 'package:memont_v2/models/login_dto/login_dto.dart';

import 'package:memont_v2/models/token/token.dart';

class AuthApi {
  var dio = DioIn().dio;

  Future<Token?> login(LoginDto body) async {
    try {
      final res = await dio.post(
        '/auth/login',
        data: body.toJson(),
      );
      final dynamic responseData = res.data['result'][
          'data']; // P_TODO: responseType 을 정하려면 class 기반 타입밖에 안나오는데, 이걸 어떻게 해결하지?

      return Token.fromJson(responseData);
    } catch (err) {
      print('login 에러: ${err.toString()}');
      return null;
    }
  }
}



// P_TODO: Legacy. Class 단위로 만들지 않고 오로지 데이터를 이동시키기 위한 인자를 직접 지정하여 사용.
// 코드 자체는 훨씬 간결한데, (파일 3개가 없는거니까.) 어떤게 더 좋은지는 모르겠다. json_serializer만 사용할까..

// class AuthApi {
//   var dio = DioIn().dio;

//   Future<Token?> login({
//     required String loginId,
//     required String providerUid,
//     required String fcmToken,
//     required String userName,
//     required String provider,
//   }) async {
//     try {
//       final res = await dio.post(
//         '/auth/login',
//         data: {
//           'loginId': loginId,
//           'providerUid': providerUid,
//           'fcmToken': fcmToken,
//           'userName': userName,
//           'provider': provider,
//         },
//       );
//       final dynamic responseData = res.data['result'][
//           'data']; 
//       print('RAW 값 확인 ${responseData.toString()}');
//       final result = Token.fromJson(responseData);

//       return result;
//     } catch (err) {
//       print('login 에러: ${err.toString()}');
//       return null;
//     }
//   // }


// }
