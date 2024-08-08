import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/pages/home_page.dart';
import 'package:my_event_app/components/descriptionrow.dart';
import 'package:my_event_app/components/custom_updating_button.dart';

import 'package:my_event_app/pages/test.dart';

import 'package:provider/provider.dart';
import 'package:my_event_app/models/organizer.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final organizer = Provider.of<Organisateur>(context);
    // print(organizer.descriptionOrganisation);
    final organizer = Provider.of<Organisateur>(context);
    print("Nom de l'organisation : ${organizer.nomOrganisation}") ;
    print(organizer.firstName);


    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: 150,
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
                          image: AssetImage("lib/images/inconu2.png"),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "username",
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
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
                                  description: "bravo",
                                  onEdit: () {
                                    // Action à effectuer lorsque l'icône est cliquée
                                  },
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "contact",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Text(
                                        "hello toi go to school with his brother, sa maman",
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                "Editer profile",
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
                              descriptionText: "mcjnencjqcjn",
                              onPressed: () {
                                // Action à effectuer lorsque l'icône est cliquée
                              },
                            ),
                            DescriptionRow(
                              descriptionTitle: "Prenom",
                              descriptionText: "mcjnencjqcjn",
                              onPressed: () {
                                // Action à effectuer lorsque l'icône est cliquée
                              },
                            ),
                            DescriptionRow(
                              descriptionTitle: "email",
                              descriptionText: "mcjnencjqcjn",
                              onPressed: () {
                                // Action à effectuer lorsque l'icône est cliquée
                              },
                            ),
                            DescriptionRow(
                              descriptionTitle: "Telephone",
                              descriptionText: "mcjnencjqcjn",
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
                                      'Deconnexion',
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
