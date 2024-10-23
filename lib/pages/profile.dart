import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/models/authprovider.dart';
import 'package:my_event_app/pages/home_page.dart';
import 'package:my_event_app/components/descriptionrow.dart';
import 'package:my_event_app/components/custom_updating_button.dart';
import 'package:my_event_app/pages/login.dart';
import 'package:my_event_app/pages/register.dart';
import 'package:my_event_app/pages/sugestion.dart';
import 'package:my_event_app/pages/test.dart';
import 'package:my_event_app/pages/reportingpage.dart';

import 'package:provider/provider.dart';
import 'package:my_event_app/models/organizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override

  Widget build(BuildContext context) {
    // final organizer = Provider.of<Organisateur>(context);
    // print(organizer.descriptionOrganisation);
    final auth = Provider.of<AuthProvider>(context);
    final organizer = Provider.of<Organisateur>(context);
    print(organizer);
    print("Nom de l'organisation : ${organizer.email}") ;
    print(organizer.avatar);
    print("http://192.168.160.151:8000${organizer.avatar!}") ;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => test()),
                        );
                      },
      
                     child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage("http://192.168.109.151:8000${organizer.avatar!}"),
      
                          ),
                        ),
                      ),
                    ),
                    Text(
                      organizer.nomOrganisation!,
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade700,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
      
                                  CustomDescription(
                                    title: "Description",
                                    description: organizer.descriptionOrganisation!,
                                    onEdit: () {
                                      // Action à effectuer lorsque l'icône est cliquée
                                    },
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.symmetric(vertical: 10),
                                  //   child: Column(
                                  //     children: [
                                  //       Row(
                                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //         children: [
                                  //           Text(
                                  //             "contact",
                                  //             style: TextStyle(
                                  //               color: Colors.white,
                                  //               fontSize: 13,
                                  //               fontWeight: FontWeight.bold,
                                  //             ),
                                  //           ),
                                  //           Icon(
                                  //             Icons.edit,
                                  //             color: Colors.white,
                                  //             size: 20,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       SizedBox(height: 15),
                                  //       Text(
                                  //         organizer.telephoneOrganisation!,
                                  //         style: TextStyle(
                                  //           color: Colors.grey.shade600,
                                  //           fontSize: 13,
                                  //           fontWeight: FontWeight.w500,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade800,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  "Compte",
                                  style: TextStyle(
                                    color: Colors.indigo[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AutofillHints.telephoneNumber,
                                  ),
                                ),
                              ),
                              DescriptionRow(
                                descriptionTitle: "Nom",
                                descriptionText: organizer.nom!,
                                onPressed: () {
                                  // Action à effectuer lorsque l'icône est cliquée
                                },
                              ),
                              DescriptionRow(
                                descriptionTitle: "Prenom",
                                descriptionText: organizer.prenom!,
                                onPressed: () {
                                  // Action à effectuer lorsque l'icône est cliquée
                                },
                              ),
                              DescriptionRow(
                                descriptionTitle: "email",
                                descriptionText:organizer.email!,
                                onPressed: () {
                                  // Action à effectuer lorsque l'icône est cliquée
                                },
                              ),
                              DescriptionRow(
                                descriptionTitle: "Telephone",
                                descriptionText: organizer.telephoneOrganisation!,
                                onPressed: () {
                                  // Action à effectuer lorsque l'icône est cliquée
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade800,
                        ),
                       
                        
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  "Plus",
                                  style: TextStyle(
                                    color: Colors.indigo[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AutofillHints.telephoneNumber,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: _openReportingPage,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Reporter un probleme',
                                          style: TextStyle(
                                            color: Colors.grey.shade300,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 0),
                                        child: IconButton(
                                          onPressed: _openReportingPage,
                                          icon: Icon(Icons.next_plan_sharp, color: Colors.white, size: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: _openSuggestionPage,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Suggerer une amelioration',
                                          style: TextStyle(
                                            color: Colors.grey.shade300,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 0),
                                        child: IconButton(
                                          onPressed: _openSuggestionPage,
                                          icon: Icon(Icons.next_plan_sharp, color: Colors.white, size: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        "Partager l'application",
                                        style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 0),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.next_plan_sharp, color: Colors.white, size: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                         Container(
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  "Confidentialité",
                                  style: TextStyle(
                                    color: Colors.indigo[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AutofillHints.telephoneNumber,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        'bolck user',
                                        style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 0),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.next_plan_sharp, color: Colors.white, size: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        'Desactiver son compte',
                                        style: TextStyle(
                                          color: Colors.red.shade400,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 0),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.next_plan_sharp, color: Colors.white, size: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade800,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                            child: GestureDetector(
                               onTap: () {
                                  // Afficher l'alerte de confirmation
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: Text('Confirmation'),
                                        content: Text('Voulez-vous vraiment vous déconnecter ?'),
                                        actions: [
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Fermer l'alerte
                                            },
                                            child: Text('Annuler' , style: TextStyle(fontSize: 12 , color: Colors.blue.shade800),),
                                            isDefaultAction: true,
                                          ),
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              Provider.of<Organisateur>(context, listen: false).logout();
                                              Provider.of<AuthProvider>(context, listen: false).clearToken();
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(builder: (context) => register()),
                                                (Route<dynamic> route) => false,
                                              );
                                            },
                                            child: Text('OK' , style: TextStyle(fontSize: 12),) ,
                                            isDestructiveAction: true,
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text(
                                            'Déconnexion',
                                            style: TextStyle(
                                              color: Colors.red.shade400,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 0),
                                          child: IconButton(
                                            onPressed: null, // L'action est gérée par le GestureDetector
                                            icon: Icon(Icons.next_plan_sharp, color: Colors.white, size: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
      
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _openReportingPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ReportingPage()));
  }
   void _openSuggestionPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => sugestionPage()));
  }
}
