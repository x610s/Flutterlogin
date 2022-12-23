
import 'dart:convert';

class ServerReponse<T> {
    ServerReponse({
        required this.mensaje,
        required this.ok,
    });

    final String mensaje;
    final bool ok;

    factory ServerReponse.fromJson(String str) => ServerReponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ServerReponse.fromMap(Map<String, dynamic> json) => ServerReponse(
        mensaje: json["mensaje"],
        ok: json["ok"],
    );

    Map<String, dynamic> toMap() => {
        "mensaje": mensaje,
        "ok": ok,
    };
}


