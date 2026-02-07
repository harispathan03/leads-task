import 'package:flutter/material.dart';
import 'package:leads_task/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Widget? child;
  final Color? color;
  const PrimaryButton({super.key, required this.text, this.onTap, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if(onTap!=null){
          onTap!();
        }
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(child: child ?? Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)),
      ),
    );
  }
}