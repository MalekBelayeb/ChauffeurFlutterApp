class User{

  String _id;
  String cin,prenom,nom;

  User(this._id,this.cin,this.prenom,this.nom);

  factory User.fromJson(Map<String, dynamic> json)
  {
    print(json);
    return User(json['_id'] as String ,
        json['cin'],json['prenom'],json['nom']
    );
  }

}