// P_MEMO: 샘플 코드입니다.
class DioResponse {
  int code;
  String message;
  dynamic data;

  DioResponse({
    required this.code,
    required this.message,
    this.data,
  });

  DioResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'],
        data = json['data'];

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
