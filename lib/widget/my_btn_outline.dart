import 'package:flutter/material.dart';

class MyBtnOutline extends StatelessWidget {
  final Function function;
  final Icon icon;
  final double borderRadiusValue;
  final Color borderColor;
  final bool circle;

   const MyBtnOutline({
    super.key,
    required this.function,
    required this.icon,
    required this.borderRadiusValue,
    required this.borderColor,
    required this.circle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        function();
      },
      style: const ButtonStyle().copyWith(
        side: MaterialStatePropertyAll(
          BorderSide(
            color: borderColor,
          ),
        ),
        shape: MaterialStatePropertyAll(
          circle
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiusValue)),
        ),
        fixedSize: circle ? null :MaterialStateProperty.all<Size>(
          const Size(30.0, 15.0),
        ),
      ),
      child: icon,
    );
  }
}
