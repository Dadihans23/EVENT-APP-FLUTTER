import 'package:flutter/material.dart';

class Organisateur extends ChangeNotifier {
  int? _id;
  String? _password;
  String? _lastLogin;
  bool? _isSuperuser;
  String? _firstName;
  String? _lastName;
  bool? _isStaff;
  bool? _isActive;
  DateTime? _dateJoined;
  String? _nom;
  String? _prenom;
  String? _email;
  String? _username;
  String? _avatar;
  String? _cover;
  String? _regToken;
  String? _nomOrganisation;
  String? _descriptionOrganisation;
  String? _adresseOrganisation;
  String? _telephoneOrganisation;
  bool? _isResettingPassword;
  bool? _estApprouve;

  Organisateur({
    int? id,
    String? password,
    String? lastLogin,
    bool? isSuperuser,
    String? firstName,
    String? lastName,
    bool? isStaff,
    bool? isActive,
    DateTime? dateJoined,
    String? nom,
    String? prenom,
    String? email,
    String? username,
    String? avatar,
    String? cover,
    String? regToken,
    String? nomOrganisation,
    String? descriptionOrganisation,
    String? adresseOrganisation,
    String? telephoneOrganisation,
    bool? isResettingPassword,
    bool? estApprouve,
  })  : _id = id,
        _password = password,
        _lastLogin = lastLogin,
        _isSuperuser = isSuperuser,
        _firstName = firstName,
        _lastName = lastName,
        _isStaff = isStaff,
        _isActive = isActive,
        _dateJoined = dateJoined,
        _nom = nom,
        _prenom = prenom,
        _email = email,
        _username = username,
        _avatar = avatar,
        _cover = cover,
        _regToken = regToken,
        _nomOrganisation = nomOrganisation,
        _descriptionOrganisation = descriptionOrganisation,
        _adresseOrganisation = adresseOrganisation,
        _telephoneOrganisation = telephoneOrganisation,
        _isResettingPassword = isResettingPassword,
        _estApprouve = estApprouve;

  // Getters
  int? get id => _id;
  String? get password => _password;
  String? get lastLogin => _lastLogin;
  bool? get isSuperuser => _isSuperuser;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  bool? get isStaff => _isStaff;
  bool? get isActive => _isActive;
  DateTime? get dateJoined => _dateJoined;
  String? get nom => _nom;
  String? get prenom => _prenom;
  String? get email => _email;
  String? get username => _username;
  String? get avatar => _avatar;
  String? get cover => _cover;
  String? get regToken => _regToken;
  String? get nomOrganisation => _nomOrganisation;
  String? get descriptionOrganisation => _descriptionOrganisation;
  String? get adresseOrganisation => _adresseOrganisation;
  String? get telephoneOrganisation => _telephoneOrganisation;
  bool? get isResettingPassword => _isResettingPassword;
  bool? get estApprouve => _estApprouve;

  // Méthode pour mettre à jour les détails de l'utilisateur à partir d'un Map
  void updateFromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _password = data['password'];
    _lastLogin = data['last_login'];
    _isSuperuser = data['is_superuser'];
    _firstName = data['first_name'];
    _lastName = data['last_name'];
    _isStaff = data['is_staff'];
    _isActive = data['is_active'];
    _dateJoined = data['date_joined'] != null ? DateTime.parse(data['date_joined']) : null;
    _nom = data['nom'];
    _prenom = data['prenom'];
    _email = data['email'];
    _username = data['username'];
    _avatar = data['avatar'];
    _cover = data['cover'];
    _regToken = data['reg_token'];
    _nomOrganisation = data['nom_organisation'];
    _descriptionOrganisation = data['description_organisation'];
    _adresseOrganisation = data['adresse_organisation'];
    _telephoneOrganisation = data['telephone_organisation'];
    _isResettingPassword = data['is_resetting_password'];
    _estApprouve = data['est_approuve'];

    notifyListeners();
  }

  void logout() {
    _id = null;
    _password = null;
    _lastLogin = null;
    _isSuperuser = null;
    _firstName = null;
    _lastName = null;
    _isStaff = null;
    _isActive = null;
    _dateJoined = null;
    _nom = null;
    _prenom = null;
    _email = null;
    _username = null;
    _avatar = null;
    _cover = null;
    _regToken = null;
    _nomOrganisation = null;
    _descriptionOrganisation = null;
    _adresseOrganisation = null;
    _telephoneOrganisation = null;
    _isResettingPassword = null;
    _estApprouve = null;

    notifyListeners();
  }

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
      dateJoined: json['date_joined'] != null ? DateTime.parse(json['date_joined']) : null,
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
      'id': _id,
      'password': _password,
      'last_login': _lastLogin,
      'is_superuser': _isSuperuser,
      'first_name': _firstName,
      'last_name': _lastName,
      'is_staff': _isStaff,
      'is_active': _isActive,
      'date_joined': _dateJoined?.toIso8601String(),
      'nom': _nom,
      'prenom': _prenom,
      'email': _email,
      'username': _username,
      'avatar': _avatar,
      'cover': _cover,
      'reg_token': _regToken,
      'nom_organisation': _nomOrganisation,
      'description_organisation': _descriptionOrganisation,
      'adresse_organisation': _adresseOrganisation,
      'telephone_organisation': _telephoneOrganisation,
      'is_resetting_password': _isResettingPassword,
      'est_approuve': _estApprouve,
    };
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

// import 'package:flutter/cupertino.dart';

// class Organisateur extends ChangeNotifier{
//   final int? id;
//   final String? password;
//   final String? lastLogin;
//   final bool? isSuperuser;
//   final String? firstName;
//   final String? lastName;
//   final bool? isStaff;
//   final bool? isActive;
//   final DateTime? dateJoined;
//   final String? nom;
//   final String? prenom;
//   final String? email;
//   final String? username;
//   final String? avatar;
//   final String? cover;
//   final String? regToken;
//   final String? nomOrganisation;
//   final String? descriptionOrganisation;
//   final String? adresseOrganisation;
//   final String? telephoneOrganisation;
//   final bool? isResettingPassword;
//   final bool? estApprouve;

//   Organisateur({
//     this.id,
//     this.password,
//     this.lastLogin,
//     this.isSuperuser,
//     this.firstName,
//     this.lastName,
//     this.isStaff,
//     this.isActive,
//     this.dateJoined,
//     this.nom,
//     this.prenom,
//     this.email,
//     this.username,
//     this.avatar,
//     this.cover,
//     this.regToken,
//     this.nomOrganisation,
//     this.descriptionOrganisation,
//     this.adresseOrganisation,
//     this.telephoneOrganisation,
//     this.isResettingPassword,
//     this.estApprouve,
//   });


//   factory Organisateur.fromJson(Map<String, dynamic> json) {
//     return Organisateur(
//       id: json['id'],
//       password: json['password'],
//       lastLogin: json['last_login'],
//       isSuperuser: json['is_superuser'],
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       isStaff: json['is_staff'],
//       isActive: json['is_active'],
//       dateJoined: DateTime.parse(json['date_joined']),
//       nom: json['nom'],
//       prenom: json['prenom'],
//       email: json['email'],
//       username: json['username'],
//       avatar: json['avatar'],
//       cover: json['cover'],
//       regToken: json['reg_token'],
//       nomOrganisation: json['nom_organisation'],
//       descriptionOrganisation: json['description_organisation'],
//       adresseOrganisation: json['adresse_organisation'],
//       telephoneOrganisation: json['telephone_organisation'],
//       isResettingPassword: json['is_resetting_password'],
//       estApprouve: json['est_approuve'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'password': password,
//       'last_login': lastLogin,
//       'is_superuser': isSuperuser,
//       'first_name': firstName,
//       'last_name': lastName,
//       'is_staff': isStaff,
//       'is_active': isActive,
//       'date_joined': dateJoined?.toIso8601String(),
//       'nom': nom,
//       'prenom': prenom,
//       'email': email,
//       'username': username,
//       'avatar': avatar,
//       'cover': cover,
//       'reg_token': regToken,
//       'nom_organisation': nomOrganisation,
//       'description_organisation': descriptionOrganisation,
//       'adresse_organisation': adresseOrganisation,
//       'telephone_organisation': telephoneOrganisation,
//       'is_resetting_password': isResettingPassword,
//       'est_approuve': estApprouve,
//     };
//   }
  
// }















// import 'package:flutter/material.dart';

// class Organisateur extends ChangeNotifier {
//   int? _id;
//   String? _password;
//   String? _lastLogin;
//   bool? _isSuperuser;
//   String? _firstName;
//   String? _lastName;
//   bool? _isStaff;
//   bool? _isActive;
//   DateTime? _dateJoined;
//   String? _nom;
//   String? _prenom;
//   String? _email;
//   String? _username;
//   String? _avatar;
//   String? _cover;
//   String? _regToken;
//   String? _nomOrganisation;
//   String? _descriptionOrganisation;
//   String? _adresseOrganisation;
//   String? _telephoneOrganisation;
//   bool? _isResettingPassword;
//   bool? _estApprouve;

//   Organisateur({
//     int? id,
//     String? password,
//     String? lastLogin,
//     bool? isSuperuser,
//     String? firstName,
//     String? lastName,
//     bool? isStaff,
//     bool? isActive,
//     DateTime? dateJoined,
//     String? nom,
//     String? prenom,
//     String? email,
//     String? username,
//     String? avatar,
//     String? cover,
//     String? regToken,
//     String? nomOrganisation,
//     String? descriptionOrganisation,
//     String? adresseOrganisation,
//     String? telephoneOrganisation,
//     bool? isResettingPassword,
//     bool? estApprouve,
//   })  : _id = id,
//         _password = password,
//         _lastLogin = lastLogin,
//         _isSuperuser = isSuperuser,
//         _firstName = firstName,
//         _lastName = lastName,
//         _isStaff = isStaff,
//         _isActive = isActive,
//         _dateJoined = dateJoined,
//         _nom = nom,
//         _prenom = prenom,
//         _email = email,
//         _username = username,
//         _avatar = avatar,
//         _cover = cover,
//         _regToken = regToken,
//         _nomOrganisation = nomOrganisation,
//         _descriptionOrganisation = descriptionOrganisation,
//         _adresseOrganisation = adresseOrganisation,
//         _telephoneOrganisation = telephoneOrganisation,
//         _isResettingPassword = isResettingPassword,
//         _estApprouve = estApprouve;

//   // Getters
//   int? get id => _id;
//   String? get password => _password;
//   String? get lastLogin => _lastLogin;
//   bool? get isSuperuser => _isSuperuser;
//   String? get firstName => _firstName;
//   String? get lastName => _lastName;
//   bool? get isStaff => _isStaff;
//   bool? get isActive => _isActive;
//   DateTime? get dateJoined => _dateJoined;
//   String? get nom => _nom;
//   String? get prenom => _prenom;
//   String? get email => _email;
//   String? get username => _username;
//   String? get avatar => _avatar;
//   String? get cover => _cover;
//   String? get regToken => _regToken;
//   String? get nomOrganisation => _nomOrganisation;
//   String? get descriptionOrganisation => _descriptionOrganisation;
//   String? get adresseOrganisation => _adresseOrganisation;
//   String? get telephoneOrganisation => _telephoneOrganisation;
//   bool? get isResettingPassword => _isResettingPassword;
//   bool? get estApprouve => _estApprouve;

//   // Setters
//   void setUserDetails({
//     int? id,
//     String? password,
//     String? lastLogin,
//     bool? isSuperuser,
//     String? firstName,
//     String? lastName,
//     bool? isStaff,
//     bool? isActive,
//     DateTime? dateJoined,
//     String? nom,
//     String? prenom,
//     String? email,
//     String? username,
//     String? avatar,
//     String? cover,
//     String? regToken,
//     String? nomOrganisation,
//     String? descriptionOrganisation,
//     String? adresseOrganisation,
//     String? telephoneOrganisation,
//     bool? isResettingPassword,
//     bool? estApprouve,
//   }) {
//     _id = id;
//     _password = password;
//     _lastLogin = lastLogin;
//     _isSuperuser = isSuperuser;
//     _firstName = firstName;
//     _lastName = lastName;
//     _isStaff = isStaff;
//     _isActive = isActive;
//     _dateJoined = dateJoined;
//     _nom = nom;
//     _prenom = prenom;
//     _email = email;
//     _username = username;
//     _avatar = avatar;
//     _cover = cover;
//     _regToken = regToken;
//     _nomOrganisation = nomOrganisation;
//     _descriptionOrganisation = descriptionOrganisation;
//     _adresseOrganisation = adresseOrganisation;
//     _telephoneOrganisation = telephoneOrganisation;
//     _isResettingPassword = isResettingPassword;
//     _estApprouve = estApprouve;

//     notifyListeners();
//   }

//   void logout() {
//     _id = null;
//     _password = null;
//     _lastLogin = null;
//     _isSuperuser = null;
//     _firstName = null;
//     _lastName = null;
//     _isStaff = null;
//     _isActive = null;
//     _dateJoined = null;
//     _nom = null;
//     _prenom = null;
//     _email = null;
//     _username = null;
//     _avatar = null;
//     _cover = null;
//     _regToken = null;
//     _nomOrganisation = null;
//     _descriptionOrganisation = null;
//     _adresseOrganisation = null;
//     _telephoneOrganisation = null;
//     _isResettingPassword = null;
//     _estApprouve = null;

//     notifyListeners();
//   }
  

//   factory Organisateur.fromJson(Map<String, dynamic> json) {
//     return Organisateur(
//       id: json['id'],
//       password: json['password'],
//       lastLogin: json['last_login'],
//       isSuperuser: json['is_superuser'],
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       isStaff: json['is_staff'],
//       isActive: json['is_active'],
//       dateJoined: json['date_joined'] != null ? DateTime.parse(json['date_joined']) : null,
//       nom: json['nom'],
//       prenom: json['prenom'],
//       email: json['email'],
//       username: json['username'],
//       avatar: json['avatar'],
//       cover: json['cover'],
//       regToken: json['reg_token'],
//       nomOrganisation: json['nom_organisation'],
//       descriptionOrganisation: json['description_organisation'],
//       adresseOrganisation: json['adresse_organisation'],
//       telephoneOrganisation: json['telephone_organisation'],
//       isResettingPassword: json['is_resetting_password'],
//       estApprouve: json['est_approuve'],
//     ); 
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': _id,
//       'password': _password,
//       'last_login': _lastLogin,
//       'is_superuser': _isSuperuser,
//       'first_name': _firstName,
//       'last_name': _lastName,
//       'is_staff': _isStaff,
//       'is_active': _isActive,
//       'date_joined': _dateJoined?.toIso8601String(),
//       'nom': _nom,
//       'prenom': _prenom,
//       'email': _email,
//       'username': _username,
//       'avatar': _avatar,
//       'cover': _cover,
//       'reg_token': _regToken,
//       'nom_organisation': _nomOrganisation,
//       'description_organisation': _descriptionOrganisation,
//       'adresse_organisation': _adresseOrganisation,
//       'telephone_organisation': _telephoneOrganisation,
//       'is_resetting_password': _isResettingPassword,
//       'est_approuve': _estApprouve,
//     };
//   }


//     // Méthode pour mettre à jour les détails de l'utilisateur à partir d'un Map
//   void updateFromMap(Map<String, dynamic> data) {
//     _id = data['id'];
//     _password = data['password'];
//     _lastLogin = data['last_login'];
//     _isSuperuser = data['is_superuser'];
//     _firstName = data['first_name'];
//     _lastName = data['last_name'];
//     _isStaff = data['is_staff'];
//     _isActive = data['is_active'];
//     _dateJoined = data['date_joined'] != null ? DateTime.parse(data['date_joined']) : null;
//     _nom = data['nom'];
//     _prenom = data['prenom'];
//     _email = data['email'];
//     _username = data['username'];
//     _avatar = data['avatar'];
//     _cover = data['cover'];
//     _regToken = data['reg_token'];
//     _nomOrganisation = data['nom_organisation'];
//     _descriptionOrganisation = data['description_organisation'];
//     _adresseOrganisation = data['adresse_organisation'];
//     _telephoneOrganisation = data['telephone_organisation'];
//     _isResettingPassword = data['is_resetting_password'];
//     _estApprouve = data['est_approuve'];

//     notifyListeners();
//   }
  
  
// }


