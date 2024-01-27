// P_MEMO: 샘플 코드입니다.
class DioResponse {
  int code;
  String message;
  dynamic data;

  DioResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  DioResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int,
        message = json['message'] as String,
        data = json['data'] as dynamic;

  Map<String, Object?> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data,
    };
  }

  DioResponse copyWith({
    int? code,
    String? message,
    dynamic data,
  }) {
    // return DioResponse(code ?? this.code, message, data);
    return DioResponse(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return 'DioResponse('
        'code: $code, '
        'message: $message, '
        'data: ${data.toString()}'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return other is DioResponse &&
        code == other.code &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      code,
      message,
      data,
    );
  }

  get messageLength => message.length;
}
