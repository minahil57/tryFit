import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:try_fit/core/imports/core_imports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.width,
      this.text,
      required this.onPressed,
      super.key,
      this.height,
      this.icon = const SizedBox.shrink(),
      this.hasIcon = false,
      this.marginBottom = 0,
      this.color = kcPrimaryColor});
  final double width;
  final double? height;
  final String? text;
  final Color color;
  final Widget icon;
  final bool hasIcon;
  final double marginBottom;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height ?? 50.sp,
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: marginBottom),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: text == null
              ? icon
              : hasIcon
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon,
                        SizedBox(
                          width: 20.sp,
                        ),
                        Text(
                          text ?? '',
                          style: getBoldStyle(
                            color: kcBlackColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      text ?? '',
                      style: getRegularStyle(
                        color: kcWhitecolor,
                        fontSize: 14.sp,
                      ),
                    ),
        ));
  }
}
