
import 'package:flutter/material.dart';

class BlogDivider extends StatelessWidget {
  const BlogDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black45,
      indent: 50,
      endIndent: 50,
      thickness: 1.2,
    );
  }
}
