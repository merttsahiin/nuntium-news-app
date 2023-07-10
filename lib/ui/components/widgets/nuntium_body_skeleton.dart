import 'package:flutter/material.dart';

import '/constants/space_constants.dart';

// Eğer sayfada TextField kullanılıyorsa ve Column: ManinAxisAlignment.spaceBetween kullanılıyorsa
// Bu Widget ile birlikte kullanılmalıdır.
class NuntiumBodySkeleton extends StatelessWidget {
  const NuntiumBodySkeleton({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double bodyHeight = deviceHeight - statusBarHeight;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: bodyHeight,
            child: Padding(
              padding: const EdgeInsets.all(SpaceConstants.defaultSpace),
              child: Column(
                mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
