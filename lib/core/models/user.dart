import 'package:flutter/material.dart' show immutable;

@immutable
final class User {
  const User({
    required this.name,
    required this.role,
    required this.email,
    required this.photo,
  });

  final String name;
  final String role;
  final String email;
  final String photo;
}
