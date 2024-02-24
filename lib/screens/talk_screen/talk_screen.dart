import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:memont_v2/apis/tag/tag_api.dart';

import 'package:memont_v2/config/build_context_extension.dart';

import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/global_state/provider/tag_provider.dart';
import 'package:memont_v2/global_state/singleton_storage.dart';

import 'package:memont_v2/global_state/provider/app_state.dart';

import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/app_bar_icon_button.dart';
import 'package:memont_v2/screens/login_screen/widgets/common_app_bar/common_app_bar.dart';
import 'package:memont_v2/screens/talk_screen/widgets/bottom_input_wrapper/bottom_input_wrapper.dart';

import 'package:memont_v2/widgets/common_layout.dart';
import 'package:provider/provider.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TalkScreen extends StatefulWidget {
  const TalkScreen({
    super.key,
  });

  @override
  State<TalkScreen> createState() => _TalkScreenState();
}

class _TalkScreenState extends State<TalkScreen> {
  String textInput = '';

  final PagingController<int, int> _pagingController = // ContentDto
      PagingController(firstPageKey: 0);

  void onChangeTextInput(String text) => setState(() => textInput = text);

  // 태그 목록 불러와서 tag provider에 세팅해줌
  void setTagList() async {
    var tagProvider = Provider.of<TagProvider>(context, listen: false);

    try {
      var tagList = await TagApi.getList();
      if (tagList != null) {
        tagProvider.tagList = tagList;
      }
      print('저장된 tag provider ? ${tagProvider.tagList}');
    } catch (err) {
      print('tag list 핸들링 에러 ${err}');
    }
  }

  Future<void> getContentInfinityScroll(int pageKey) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      // P_TODO: 목록 불러오기 임시값. content api 써야함.
      final nextPageKey = pageKey + 1; // 1페이지 더하기
      if (nextPageKey < 5) {
        _pagingController
            .appendPage([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], nextPageKey);
      } else {
        _pagingController.appendLastPage([1, 2, 3]);
      }
    } catch (e) {
      print("memo content 불러오기 에러: $e");
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      getContentInfinityScroll(pageKey);
    });
    // P_MEMO: 빌드가 끝나는 시점에 실행함.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setTagList();
    });
  }

  // @override
  // void didUpdateWidget(Widget oldWidget) {
  // }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var tagProvider = context.watch<TagProvider>();
    var colors = context.colors;
    var textStyle = context.textStyle;
    SingletonStorage storage = SingletonStorage();

    void onPressSaveMemoButton() {
      // P_TODO: + 눌러서 저장.
      var arr = textInput.split('#');
      String content = arr[0].trim();
      bool hasTag = arr.asMap().containsKey(1);
      if (content == '') return;
      // String? content = arr[0];
      // String #dfdf? tag = arr?[1];
      print('저장 OR 수정 $arr');
    }

// P_MEMO: 눌렀을 때 input을 닫기 위함.
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CommonLayout(
        child: Scaffold(
          // P_TODO: 이거 웹에서는 어떻게 나오는지 확인해야 함
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: CommonAppBar(
              iconButtonList: [
                AppBarIconButton(
                  routes: ROUTES.setting,
                  iconData: FontAwesomeIcons.gear,
                ),
                AppBarIconButton(
                  routes: ROUTES.tag,
                  iconData: FontAwesomeIcons.tag,
                )
              ],
            ),
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // P_TODO: 헤더가 들어갈 영역.

              // P_MEMO: 아이템 영역
              Expanded(
                child: PagedListView<int, int>(
                  reverse: true,
                  pagingController: _pagingController, //저장했던 정보들
                  builderDelegate: PagedChildBuilderDelegate<int>(
                    itemBuilder: (context, item, index) => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        // P_TODO: 아이템 UI.
                        'TEST $index',
                        style: textStyle.display['sm']?.copyWith(
                          color: colors.primary[500],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Input 등등
              BottomInputWrapper(
                onPressSaveMemoButton: onPressSaveMemoButton,
                onChangeTextInput: onChangeTextInput,
              )
            ],
          ),
        ),
      ),
    );
  }
}
