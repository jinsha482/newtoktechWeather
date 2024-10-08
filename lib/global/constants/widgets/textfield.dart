import 'package:flutter/material.dart'; 
class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key, 
    this.onTap,
    this.label,
    this.style,
    this.prefix,
    this.suffix,
    this.focusNode,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.labelText,
    this.showCursor,
    this.suffixIcon,
    this.maxLines = 1,
    this.textInputAction,
    required this.hintText,
    required this.readOnly,
    required this.boxWidth,
     required this.boxHeight,
    required this.textAlign,
    required this.textColor,
    this.obscureText = false,
    required this.textEditingController,
    this.keyboardType = TextInputType.name,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.textCapitalization = TextCapitalization.none,
    this.onFieldSubmitted,
  }) : super(key: key); 

  final int maxLines;
  final bool readOnly;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final TextStyle? style;
  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final String hintText;
  final double boxWidth;
  final double boxHeight;
  final Color textColor;
  final void Function()? onTap;
  final bool? showCursor;
  final EdgeInsets? scrollPadding;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final TextEditingController textEditingController;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: boxHeight,
      width: boxWidth,
      child: TextFormField(
        autofocus: true,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        readOnly: readOnly,
        cursorColor: Colors.black,
        maxLength: maxLength,
        textAlign: textAlign,
        validator: validator,
        onChanged: onChanged,
        showCursor: showCursor ?? true,
        obscureText: obscureText,
        keyboardType: keyboardType,
        scrollPadding: scrollPadding!,
        textInputAction: textInputAction,
        controller: textEditingController,
        enableInteractiveSelection: true,
        textCapitalization: textCapitalization,
        maxLines: maxLines,
        style: TextStyle( // Use standard TextStyle instead of GoogleFonts for now
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          prefix: prefix,
          hintText: hintText,
          labelText: labelText,
          suffix: suffix,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder( // Use OutlineInputBorder instead of UnderlineInputBorder
            borderSide: const BorderSide(color: Colors.grey), // Adjust color as needed
            borderRadius: BorderRadius.circular(8.0), // Adjust radius as needed
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labelStyle: const TextStyle( 
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
