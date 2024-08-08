
class Organisateur {
  final int? id;
  final String? password;
  final String? lastLogin;
  final bool? isSuperuser;
  final String? firstName;
  final String? lastName;
  final bool? isStaff;
  final bool? isActive;
  final DateTime? dateJoined;
  final String? nom;
  final String? prenom;
  final String? email;
  final String? username;
  final String? avatar;
  final String? cover;
  final String? regToken;
  final String? nomOrganisation;
  final String? descriptionOrganisation;
  final String? adresseOrganisation;
  final String? telephoneOrganisation;
  final bool? isResettingPassword;
  final bool? estApprouve;

  Organisateur({
    this.id,
    this.password,
    this.lastLogin,
    this.isSuperuser,
    this.firstName,
    this.lastName,
    this.isStaff,
    this.isActive,
    this.dateJoined,
    this.nom,
    this.prenom,
    this.email,
    this.username,
    this.avatar,
    this.cover,
    this.regToken,
    this.nomOrganisation,
    this.descriptionOrganisation,
    this.adresseOrganisation,
    this.telephoneOrganisation,
    this.isResettingPassword,
    this.estApprouve,
  });


  factory Organisateur.fromJson(Map<String, dynamic> json) {
    return Organisateur(
      id: json['id'],
      password: json['password'],
      lastLogin: json['last_login'],
      isSuperuser: json['is_superuser'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      isStaff: json['is_staff'],
      isActive: json['is_active'],
      dateJoined: DateTime.parse(json['date_joined']),
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      username: json['username'],
      avatar: json['avatar'],
      cover: json['cover'],
      regToken: json['reg_token'],
      nomOrganisation: json['nom_organisation'],
      descriptionOrganisation: json['description_organisation'],
      adresseOrganisation: json['adresse_organisation'],
      telephoneOrganisation: json['telephone_organisation'],
      isResettingPassword: json['is_resetting_password'],
      estApprouve: json['est_approuve'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'last_login': lastLogin,
      'is_superuser': isSuperuser,
      'first_name': firstName,
      'last_name': lastName,
      'is_staff': isStaff,
      'is_active': isActive,
      'date_joined': dateJoined?.toIso8601String(),
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'username': username,
      'avatar': avatar,
      'cover': cover,
      'reg_token': regToken,
      'nom_organisation': nomOrganisation,
      'description_organisation': descriptionOrganisation,
      'adresse_organisation': adresseOrganisation,
      'telephone_organisation': telephoneOrganisation,
      'is_resetting_password': isResettingPassword,
      'est_approuve': estApprouve,
    };
  }
}
