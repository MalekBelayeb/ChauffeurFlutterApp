class User{

  String id, cin,prenom,nom;

  User(this.id,this.cin,this.prenom,this.nom);

  factory User.fromJson(Map<String, dynamic> json)
  {
    return User(json['_id'] as String ,
        json['cin'],json['prenom'],json['nom']
    );
  }

}