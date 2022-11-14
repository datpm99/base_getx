import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/const/import_const.dart';

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: const CupertinoActivityIndicator().pSymmetric(v: 30),
    );
  }
}
