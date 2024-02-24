class CursorResponse<T> {
  List<T> data;
  int? cursor;
  CursorResponse({
    required this.cursor,
    required this.data,
  });
}
