import 'package:flutter/material.dart';

class PrimaryButton extends OutlinedButton{
  PrimaryButton({required super.onPressed, required String title}) : super(child: Text(title));
}