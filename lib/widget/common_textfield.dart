import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield({super.key, this.hintStyle, this.hintText, this.onChange, this.controller, this.textStyle, this.inputFormatters,
   this.maxLength, this.textInputType, this.maxLines, this.contentPadding, this.textInputAction, this.minLines, this.counter, this.suffix, this.prefix, this.readOnly= false, this.label, this.validator, this.obscureText= false, this.textCapitalization = TextCapitalization.none, this.border, this.onTap, this.fillColor});
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Function(String text)? onChange;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? counter;
  final bool readOnly;
  final String? label;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final InputBorder? border;
  final void Function()? onTap;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label!=null)...[ 
          Text(label!, style: TextStyle(fontSize: 14),),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          onChanged: (value)=> onChange != null ? onChange!(value) : (){},
            style: textStyle ?? TextStyle(fontSize: 14, color: Colors.black),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textAlignVertical: TextAlignVertical.center,
            maxLength: maxLength,
            keyboardType: textInputType,
            obscureText: obscureText,
            inputFormatters: inputFormatters,
            minLines: minLines ?? 1,
            textInputAction: textInputAction ?? TextInputAction.done,
            maxLines: obscureText ? 1 : maxLines,
            buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => SizedBox(),
            readOnly:readOnly ,
            validator: validator,
            textCapitalization: textCapitalization,
            onTap: onTap,
            decoration: InputDecoration(
              counter: counter,
              isDense: true,
              prefixIcon: prefix,
              // prefixIconConstraints: BoxConstraints(maxHeight: context.getHeight(24)),
              suffixIcon: suffix,
              // suffixIconConstraints: BoxConstraints(maxHeight: context.getHeight(24)),
              filled: true,
              fillColor:  fillColor ?? (readOnly ? Colors.black.withValues(alpha: 0.05) : Colors.white),
              contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16,vertical: 12), 
              hintText: hintText ?? "Enter $label",
              border: border ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: border ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: border ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red),
              ),
              errorStyle: TextStyle(fontSize: 12, color: Colors.red),
              hintStyle: hintStyle ?? TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
      ],
    );
  }
}