import 'package:flutter/material.dart';

class AppTypography {
  static const body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const h1 = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w700,
  );

  static const display = {
    'lg': TextStyle(
      fontSize: 80,
      fontWeight: FontWeight.w800,
    ),
    'md': TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.w800,
    ),
    'sm': TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w800,
    )
  };
  static const title = {
    'lg': TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w700,
    ),
    'md': TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w700,
    ),
    'sm': TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w600,
    )
  };
  static const heading = {
    'lg': TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ),
    'md': TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
    ),
    'sm': TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    )
  };
  static const body = {
    'lg': TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    'md': TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    'sm': TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    )
  };
  static const detail = {
    'lg': TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    'md': TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    'sm': TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
    )
  };
}
