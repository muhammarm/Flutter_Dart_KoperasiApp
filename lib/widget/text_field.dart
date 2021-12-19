import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koperasi/utils/number_format.dart';
import 'package:koperasi/utils/text_styles.dart';

class TextFieldWidget extends StatefulWidget {
  String title = '';
  String? hintText;
  bool? numberpad = false;
  bool? digitOnly = false;
  TextEditingController controller;
  bool? isDisabled = false;
  String? prefixText = '';
  bool? currencyFormatted = false;
  String? autoFillHints = '';
  String? Function(String? value)? validator;
  String? errorText;

  TextFieldWidget({
    Key? key,
    required this.title,
    this.hintText,
    this.numberpad,
    this.digitOnly,
    this.isDisabled,
    required this.controller,
    this.prefixText,
    this.currencyFormatted,
    this.autoFillHints,
    this.validator,
    this.errorText
  }) : super(key: key);

  @override
  _KaskitaTextFieldWidgetState createState() => _KaskitaTextFieldWidgetState();
}

class _KaskitaTextFieldWidgetState extends State<TextFieldWidget> {
  String? _hint;

  void _onChanged(bool hasFocus) {
    if (hasFocus) {
      setState(() {
        _hint = '';
      });
    } else {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      setState(() {
        _hint = widget.hintText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool _isDisabled = widget.isDisabled ?? false;

    return Container(
      decoration: BoxDecoration(
          color: _isDisabled ? Colors.grey.withOpacity(0.2) : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyles.fieldTitle(context),
            ),
            Focus(
              child: Center(
                child: TextFormField(
                    autofillHints:
                    !_isDisabled ? [widget.autoFillHints ?? ''] : null,
                    enabled: !_isDisabled,
                    controller: widget.controller,
                    style: TextStyles.fieldInput(context),
                    validator: widget.validator,
                    decoration: InputDecoration(
                        errorText: widget.errorText,
                        prefixText: widget.prefixText,
                        border: InputBorder.none,
                        hintText: _hint ?? widget.hintText,
                        hintStyle: Theme.of(context).textTheme.subtitle1,
                        isDense: true,
                        errorStyle: const TextStyle(color: Colors.red, fontSize: 10)
                    ),
                    keyboardType: widget.numberpad == true
                        ? TextInputType.number
                        : TextInputType.text,
                    inputFormatters: (widget.numberpad == true &&
                        widget.digitOnly == true)
                    ? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
                        : [],
                    onChanged: (str) {
                      if (widget.currencyFormatted == true) {
                        var tempNumber = str.replaceAll(',', '');
                        String numberFormatted = '';
                        try {
                          numberFormatted =
                              currFormat.format(double.parse(tempNumber));
                        } catch (e) {
                          numberFormatted = '0';
                        }
                        widget.controller.value = TextEditingValue(
                          text: numberFormatted,
                          selection: TextSelection.collapsed(
                              offset: numberFormatted.length),
                        );
                      }
                    }),
              ),
              onFocusChange: _onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
