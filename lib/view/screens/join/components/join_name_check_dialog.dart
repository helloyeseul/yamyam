import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamstack/resource/color_resource.dart';
import 'package:yamstack/view/common/components/text/noto_sans_text.dart';

class JoinNameCheckDialog extends StatelessWidget {
  const JoinNameCheckDialog({Key? key, required this.message})
      : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            height: 161,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 110,
                  child: Center(child: NotoSansText(message, size: 14)),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: ColorResource.grey_0xffeeeeee,
                ),
                SizedBox(
                  height: 50,
                  child: Center(
                    child: TextButton(
                      onPressed: Get.back,
                      child: NotoSansText('확인', size: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
