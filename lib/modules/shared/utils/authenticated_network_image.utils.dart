import 'package:flutter/material.dart';
import 'package:project/modules/auth/providers/auth.provider.dart';
import 'package:provider/provider.dart';

NetworkImage authNetworkImage(
  BuildContext context,
  String url, {
  double? scale,
  Map<String, String>? headers,
}) {
  final token = Provider.of<AuthProvider>(context, listen: false).authToken;
  if (token != null) headers = {'Authorization': 'Bearer $token'};
  if (scale != null) return NetworkImage(url, headers: headers, scale: scale);
  return NetworkImage(url, headers: headers);
}
