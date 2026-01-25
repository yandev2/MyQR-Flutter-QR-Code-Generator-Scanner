import 'package:flutter/material.dart';
import 'package:myqrcode/core/color/pallet_color.dart';
import 'package:myqrcode/core/design/responsif_design.dart';
import '../enum/app_style.dart';

class CheckboxCard extends StatelessWidget {
  const CheckboxCard({
    super.key,
    required this.value,
    required this.onTap,
    this.title,
    this.subtitle,
    this.style = AppStyle.primary,
    this.backgroundColor,
    this.checkColor,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.all(16),
  });

  final bool value;
  final VoidCallback onTap;

  final String? title;
  final String? subtitle;

  final AppStyle style;
  final Color? backgroundColor;
  final Color? checkColor;

  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final colors = _resolveCheckboxCardColors(
      style: style,
      backgroundOverride: backgroundColor,
      checkOverride: checkColor,
    );

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: onTap,
      child: Container(
        padding: borderRadius == 0 ? null : padding,
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(borderRadius),
          border: borderRadius == 0 ? null : Border.all(color: colors.border),
        ),
        child: Row(
          children: [
            _CheckboxBox(value: value, activeColor: colors.check),
            const SizedBox(width: 12),
            Expanded(
              child: _CheckboxText(title: title, subtitle: subtitle),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckboxBox extends StatelessWidget {
  const _CheckboxBox({required this.value, required this.activeColor});

  final bool value;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: size(20),
      width: size(20),
      decoration: BoxDecoration(
        color: value ? activeColor : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: value ? activeColor : Colors.grey.shade400, width: 2),
      ),
      child: value ? Icon(Icons.check, size: size(16), color: Colors.white) : null,
    );
  }
}

class _CheckboxText extends StatelessWidget {
  const _CheckboxText({this.title, this.subtitle});

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    if (title == null && subtitle == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            textScaler: TextScaler.linear(scale()),
            style: TextTheme.of(context).bodySmall,
          ),
        if (subtitle != null) ...[
          SizedBox(height: sizeHeight(4)),
          Text(
            subtitle!,
            textScaler: TextScaler.linear(scale()),
            style: TextTheme.of(context).bodySmall,
          ),
        ],
      ],
    );
  }
}

class _CheckboxCardColors {
  const _CheckboxCardColors({required this.background, required this.border, required this.check});

  final Color background;
  final Color border;
  final Color check;
}

_CheckboxCardColors _resolveCheckboxCardColors({
  required AppStyle style,
  Color? backgroundOverride,
  Color? checkOverride,
}) {
  switch (style) {
    case AppStyle.primary:
      return _CheckboxCardColors(
        // ignore: deprecated_member_use
        background: backgroundOverride ?? PalletColor().palletApp(style).withOpacity(0.08),
        border: PalletColor().palletApp(style),
        check: checkOverride ?? PalletColor().palletApp(style),
      );

    case AppStyle.success:
      return _CheckboxCardColors(
        // ignore: deprecated_member_use
        background: backgroundOverride ?? PalletColor().palletApp(style).withOpacity(0.08),
        // ignore: deprecated_member_use
        border: PalletColor().palletApp(style).withOpacity(0.3),
        check: checkOverride ?? PalletColor().palletApp(style),
      );

    case AppStyle.warning:
      return _CheckboxCardColors(
        // ignore: deprecated_member_use
        background: backgroundOverride ?? PalletColor().palletApp(style).withOpacity(0.08),
        // ignore: deprecated_member_use
        border: PalletColor().palletApp(style).withOpacity(0.3),
        check: checkOverride ?? PalletColor().palletApp(style),
      );

    case AppStyle.danger:
      return _CheckboxCardColors(
        // ignore: deprecated_member_use
        background: backgroundOverride ?? PalletColor().palletApp(style).withOpacity(0.08),
        // ignore: deprecated_member_use
        border: PalletColor().palletApp(style).withOpacity(0.3),
        check: checkOverride ?? PalletColor().palletApp(style),
      );

    case AppStyle.custom:
      final color = checkOverride ?? PalletColor().palletApp(AppStyle.primary);
      return _CheckboxCardColors(
        // ignore: deprecated_member_use
        background: backgroundOverride ?? PalletColor().palletApp(style).withOpacity(0.08),
        // ignore: deprecated_member_use
        border: color.withOpacity(0.3),
        check: color,
      );
  }
}


//example 

//CheckboxCard(
//  value: isChecked,
//  onTap: () => setState(() => isChecked = !isChecked),
//  title: 'Setuju dengan syarat',
//  subtitle: 'Wajib dicentang sebelum lanjut',
//  style: AppStyle.danger,
//);