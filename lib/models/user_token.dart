// To parse this JSON data, do
//
//     final userTokenResponse = userTokenResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserTokenResponse {
    UserTokenResponse({
        required this.userToken,
    });

    final UserToken userToken;

    factory UserTokenResponse.fromJson(String str) => UserTokenResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserTokenResponse.fromMap(Map<String, dynamic> json) => UserTokenResponse(
        userToken: UserToken.fromMap(json["userToken"]),
    );

    Map<String, dynamic> toMap() => {
        "userToken": userToken.toMap(),
    };
}

class UserToken {
    UserToken({
        required this.token,
        required this.expiration,
    });

    final String token;
    final DateTime expiration;

    factory UserToken.fromJson(String str) => UserToken.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserToken.fromMap(Map<String, dynamic> json) => UserToken(
        token: json["token"],
        expiration: DateTime.parse(json["expiration"]),
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "expiration": expiration.toIso8601String(),
    };
}
