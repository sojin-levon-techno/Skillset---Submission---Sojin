import 'package:flutter/material.dart';
import 'package:skilltest/core/colors/colors.dart';
import 'package:skilltest/core/extension/mediaquery.dart';
import 'package:skilltest/core/extension/textstyle.dart';
import 'package:skilltest/features/profile/widgets/drag_handle.dart';

class AndroidBottomSheetWidget extends StatelessWidget {
  final String title;
  final String message;
  final Widget confirmText;
  final Widget cancelText;
  final Function()? cancel;
  final Function()? confirm;

  const AndroidBottomSheetWidget({
    super.key,
    this.cancel,
    this.confirm,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: context.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          color: kWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              DragHandleWidget(),
              const SizedBox(height: 22),
              Text(
                title,
                style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(textAlign: TextAlign.center, message),
              const SizedBox(height: 22),
              GestureDetector(
                onTap: cancel,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kPrimary,
                  ),
                  child: Center(child: cancelText),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: confirm,

                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kPrimary),
                  ),
                  child: Center(child: confirmText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
