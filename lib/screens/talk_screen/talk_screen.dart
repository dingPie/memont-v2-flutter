import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/apis/content/content_api.dart';

import 'package:memont_v2/apis/tag/tag_api.dart';

import 'package:memont_v2/config/build_context_extension.dart';

import 'package:memont_v2/constants/routes.dart';
import 'package:memont_v2/global_state/provider/tag_provider.dart';
import 'package:memont_v2/global_state/singleton_storage.dart';

import 'package:memont_v2/global_state/provider/app_state.dart';
import 'package:memont_v2/models/content_dto/content_dto.dart';
import 'package:memont_v2/models/get_content_dto/get_content_dto.dart';

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
  TextEditingController bottomInputController = TextEditingController();
  String textInput = '';

  final PagingController<int, ContentDto> _pagingController = // ContentDto
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

  // 무한스크롤 형식으로 데이터 받이오기
  Future<void> getContentInfinityScroll(int pageKey) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      GetContentDto getContentDto = GetContentDto(cursor: pageKey);
      var contentList = await ContentApi.getListByCursor(getContentDto);
      if (contentList == null) throw '';

      bool isLast = contentList.cursor == null;
      if (isLast) {
        _pagingController.appendLastPage(contentList.data);
      } else {
        _pagingController.appendPage(contentList.data, contentList.cursor);
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

    // P_TODO: + 눌러서 저장.
    void onPressSaveMemoButton() async {
      var arr = bottomInputController.text.split('#');
      String content = arr[0].trim();
      if (content == '') return;

      bool hasTag = arr.asMap().containsKey(1);
      String? tagName = hasTag ? arr[1] : null;
      onChangeTextInput('');
      var contentDto = ContentDto(content: content, tagName: tagName);
      ContentApi.createMemo(contentDto);

      setState(() {
        bottomInputController.clear();
      });
      // P_TODO: 항목에 넣어주는거 필요함.
      // P_TODO: 아래가 최신 값이어야 함. (api 단에서 하자..)
      // P_TODO: 값 추가후 추가된 값을 반환하도록 서버로직도 바꿔야겠네 ...;
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
                child: PagedListView<int, ContentDto>(
                  pagingController: _pagingController, //저장했던 정보들
                  reverse: true,

                  builderDelegate: PagedChildBuilderDelegate<ContentDto>(
                    itemBuilder: (context, item, index) => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        // P_TODO: 아이템 UI. 그려야함.
                        '${item.content} ${item.id}',
                        style: textStyle.heading['lg']?.copyWith(
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
                bottomInputController: bottomInputController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
