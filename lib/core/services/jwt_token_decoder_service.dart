import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:travel_nepal/core/services/local_storage.dart';

@lazySingleton
class JwtTokenDecoderService {
  final LocalStorageService _localStorageService;
  JwtTokenDecoderService(this._localStorageService);
  Map<String, dynamic> customDecodeJwt() {
    final token = _localStorageService.read(LocalStorageKeys.accessToken);
    if (token == null) {
      return {};
    }

    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid JWT format');
    }
    final payload = parts[1];
    String normalizedPayload = base64Url.normalize(payload);
    final String decoded = utf8.decode(base64Url.decode(normalizedPayload));
    final Map<String, dynamic> jwtData = json.decode(decoded);

    return jwtData;
  }
}
