class Usuario {
  int? id;
  String? nombre;
  String? apellidos;
  String? email;
  String? password;

  Usuario({this.id, this.nombre, this.apellidos, this.email, this.password});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['apellidos'] = this.apellidos;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
