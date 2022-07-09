class LoginResponse {
  List<Usuario> usuario;

  LoginResponse({this.usuario});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json['usuario'] != null) {
      usuario = <Usuario>[];
      json['usuario'].forEach((v) {
        usuario.add(new Usuario.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.usuario != null) {
      data['usuario'] = this.usuario.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Usuario {
  int id;
  String nombres;
  String apellidos;
  String email;
  String password;

  Usuario({this.id, this.nombres, this.apellidos, this.email, this.password});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombres = json['nombres'];
    apellidos = json['apellidos'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombres'] = this.nombres;
    data['apellidos'] = this.apellidos;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
