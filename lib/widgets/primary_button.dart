import 'package:flutter/material.dart';
import 'package:wework/enums/button_state.dart';

class PrimaryButton extends StatelessWidget {
  final ButtonState buttonState;
  final Function onPressed;
  final String title;
  final double titleSize;
  final Color buttonBgColor;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    this.borderRadius = 99,
    this.buttonState = ButtonState.ENABLE,
    this.buttonBgColor = Colors.black,
    required this.onPressed,
    required this.title,
    this.titleSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !(buttonState == ButtonState.ENABLE),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: () {
          if (buttonState == ButtonState.ENABLE) {
            onPressed();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: buttonState == ButtonState.ENABLE
                ? buttonBgColor
                : const Color(0xffEBECEF),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
