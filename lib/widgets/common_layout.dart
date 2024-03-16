import 'package:flutter/material.dart';
import 'package:memont_v2/config/build_context_extension.dart';
import 'package:memont_v2/global_state/provider/app_state.dart';
import 'package:provider/provider.dart';

class CommonLayout extends StatelessWidget {
  const CommonLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var colors = context.colors;

    return Stack(
      children: [
        child,
        if (appState.isLoading)
          Container(
            color: colors.gray[800]?.withOpacity(0.3),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
