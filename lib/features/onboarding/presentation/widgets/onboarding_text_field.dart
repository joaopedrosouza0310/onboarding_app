import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Reusable labeled text field for onboarding steps.
///
/// Validates on blur (focusNode loses focus) rather than on every keystroke.
class OnboardingTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final String? semanticsIdentifier;
  final Widget? prefixIcon;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  const OnboardingTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.autofocus = false,
    this.semanticsIdentifier,
    this.prefixIcon,
    this.maxLength,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  State<OnboardingTextField> createState() => _OnboardingTextFieldState();
}

class _OnboardingTextFieldState extends State<OnboardingTextField> {
  late final FocusNode _focusNode;
  String? _errorText;
  bool _touched = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    // Validate on blur — never on every keystroke.
    if (!_focusNode.hasFocus && _touched) {
      setState(() {
        _errorText = widget.validator?.call(widget.controller.text);
      });
    }
  }

  void _onChanged(String value) {
    _touched = true;
    widget.onChanged?.call(value);
    // Clear error while the user is actively typing.
    if (_errorText != null) {
      setState(() => _errorText = null);
    }
  }

  /// Called by the parent [Form] when it validates all fields at once.
  String? _validate(String? value) {
    final error = widget.validator?.call(value);
    setState(() => _errorText = error);
    return error;
  }

  @override
  Widget build(BuildContext context) {
    final field = TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      autofocus: widget.autofocus,
      maxLength: widget.maxLength,
      onChanged: _onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: _validate,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: widget.prefixIcon,
        errorText: _errorText,
        // Hide the default counter to keep the UI clean.
        counterText: '',
      ),
    );

    if (widget.semanticsIdentifier != null) {
      return Semantics(identifier: widget.semanticsIdentifier, child: field);
    }
    return field;
  }
}
