import 'package:flutter/cupertino.dart';

import '../../utils/constants/const_colors.dart';

class CandidateHeader extends StatelessWidget {
  const CandidateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration:
          const BoxDecoration(color: textTertiary, boxShadow: [BoxShadow()]),
      child: const Row(
        children: [],
      ),
    );
  }
}
