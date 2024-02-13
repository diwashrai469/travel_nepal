import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_theme.dart';
import '../constant/app_dimens.dart';
import '../constant/ui_helpers.dart';

class KTextFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? diabled;
  final Iterable<String>? autofillHints;
  final String? hint;
  final String? initialValue;
  final String? label;
  final bool required;
  final bool obscureText;
  final bool? autoFocus;
  final TextInputType keyboardType;
  final dynamic maxLines;
  final int? maxlength;
  final String? errorText;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? formatters;

  final Widget? prefixIcon, suffixIcon;
  final bool takeCheckSpace;

  const KTextFormField(
      {this.takeCheckSpace = false,
      this.prefixIcon,
      this.contentPadding,
      this.autoFocus = false,
      this.suffixIcon,
      this.focusNode,
      this.validator,
      this.autofillHints,
      this.maxlength,
      this.diabled = false,
      this.onChanged,
      this.required = true,
      this.hint,
      this.label,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.maxLines = 1,
      this.controller,
      this.initialValue,
      this.errorText,
      this.formatters,
      super.key});

  @override
  _KTextFormFieldState createState() => _KTextFormFieldState();
}

class _KTextFormFieldState extends State<KTextFormField> {
  /// Since custom positioning of default error message was not possible,
  /// this new errorText state variable was created to custom show the validation
  String? errorText;

  /// A checkmark is need to be shown in the TextFormField once the interaction has started
  /// and the validation is error free. This boolean state variable keeps track of whether the interaction has begun or not
  bool interacted = false;

  /// Obscure Text is used for passwords.
  /// This variable needs to be toggled whenever, show/hide state of password is to be toggled.
  late bool obscureText;

  _KTextFormFieldState();

  @override
  void initState() {
    super.initState();
    errorText = widget.errorText;
    if (widget.initialValue != null) {
      setupValues();
    }
    setState(() {
      obscureText = widget.obscureText;
    });
  }

  void setupValues() async {
    await Future.delayed(const Duration(milliseconds: 0));
    widget.onChanged?.call(widget.initialValue!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty)
          Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: widget.label,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                          children: <InlineSpan>[
                            if (widget.required == true)
                              const TextSpan(
                                text: '* ',
                                style: TextStyle(color: errorColor),
                              )
                          ],
                        ),
                      ),
                    ],
                  )),
              sHeightSpan,
            ],
          ),
        TextFormField(
          autofillHints: widget.autofillHints,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          autovalidateMode: AutovalidateMode.disabled,
          maxLength: widget.maxlength,
          inputFormatters: widget.formatters,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: obscureText,

          enabled: !widget.diabled!,
          autofocus: widget.autoFocus ?? false,
          focusNode: widget.focusNode,
          // minLines: 1,

          initialValue: widget.initialValue,
          maxLines: widget.maxLines,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: (widget.initialValue?.isEmpty == true ||
                      widget.initialValue == null)
                  ? null
                  : Colors.grey),

          decoration: InputDecoration(
            contentPadding: widget.contentPadding,
            hintText: widget.hint,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey),

            prefixIcon: widget.prefixIcon,

            /// For passwords, we need a toggle icon instead of the checkmark,
            /// so we show the toggle buttons as a first priority, then the checkmark.
            suffixIcon: widget.maxLines == 1
                ? widget.obscureText
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8).dg,
                        child: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: darkGrey,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                      )
                    : (widget.suffixIcon != null)
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.suffixIcon != null) widget.suffixIcon!,
                              if (widget.suffixIcon != null) mWidthSpan,
                              if ((interacted && errorText == null) ||
                                  widget.takeCheckSpace)
                                Icon(
                                  Icons.check,
                                  color: (interacted && errorText == null)
                                      ? secondaryColor
                                      : Colors.transparent,
                                ),
                              if (widget.suffixIcon != null) mWidthSpan,
                            ],
                          )
                        : (interacted && errorText == null)
                            ? const Icon(
                                Icons.check,
                                color: secondaryColor,
                              )
                            : null
                : null,
            errorStyle:
                const TextStyle(height: 0, fontSize: 0, color: errorColor),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15).r,
                borderSide: const BorderSide(color: primaryColor)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15).r,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0).r,
              borderSide: const BorderSide(color: Colors.grey),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0).r,
              borderSide: const BorderSide(
                color: darkGrey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0).r,
              borderSide: const BorderSide(
                color: errorColor,
              ),
            ),
          ),
          validator: widget.validator,
          // autovalidateMode: AutovalidateMode.onUserInteraction,

          /// Since, default styling for the errorText was not appropriate,
          /// the validator is called manually inside of onChanged and the state variables are updated.
          onChanged: (value) {
            if (widget.validator != null) {
              setState(() {
                errorText = widget.validator!(value);
                interacted = true;
              });
            }
            widget.onChanged?.call(value);
          },
        ),
        if (errorText != null)
          Column(
            children: [
              sHeightSpan,
              Text(
                errorText ?? "",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: AppDimens.headlineFontSizeXXXSmall,
                    ),
              ),
            ],
          )
      ],
    );
  }
}
