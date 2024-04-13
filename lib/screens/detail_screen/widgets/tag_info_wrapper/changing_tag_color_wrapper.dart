import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/models/palette_dto.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';
import 'package:memont_v2/utils/util_method.dart';

class ChangingTagColorWrapper extends StatelessWidget {
  const ChangingTagColorWrapper({
    super.key,
    this.tagInfo,
    this.selectedPalette,
    required this.paletteList,
    required this.onPressTagColorItem,
    required this.onPressConfirmChangeColorButton,
  });

  final TagDto? tagInfo;
  final PaletteDto? selectedPalette;
  final List<PaletteDto>? paletteList;
  final void Function(PaletteDto? palette) onPressTagColorItem;
  final void Function() onPressConfirmChangeColorButton;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors;
    var textStyle = context.textStyle;

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: UtilMethod.hexToColor(selectedPalette?.color),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: colors.gray[300]!,
                blurStyle: BlurStyle.solid,
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              child: Text(
                tagInfo?.name ?? '#',
                style: textStyle.heading['sm'],
                overflow: TextOverflow.ellipsis,
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width - 48 - 32,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 4),
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () => onPressTagColorItem(paletteList?[index]),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: UtilMethod.hexToColor(paletteList?[index].color),
                      border: Border.all(
                        color: colors.primary[500]!,
                        width: paletteList?[index].id == selectedPalette?.id
                            ? 2
                            : 0,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 6),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: paletteList?.length ?? 0,
                physics: const BouncingScrollPhysics(),
              ),
            ),
            IconButton(
              onPressed: onPressConfirmChangeColorButton,
              padding: const EdgeInsets.all(8), // 패딩 설정
              constraints: const BoxConstraints(), // constraints
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.white,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                elevation: 2,
                shadowColor: colors.gray[100],
              ),
              icon: Icon(
                FontAwesomeIcons.check,
                size: 16,
                color: colors.gray[700],
              ),
            )
          ],
        ),
      ],
    );
  }
}
