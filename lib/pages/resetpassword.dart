import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/pages/login.dart';
import'package:my_event_app/pages/newpassword.dart';


class resetpassword extends StatefulWidget {
  const resetpassword({super.key});

  @override
  State<resetpassword> createState() => _resetpasswordState();
}
  final TextEditingController _emailController = TextEditingController();

class _resetpasswordState extends State<resetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      
      body: SafeArea(
        child: Center(
         child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
           child: Column(
            children: [

              
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  " MOT DE PASSE OUBLIE ?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    decorationStyle: TextDecorationStyle.double,
                  ),
                ),
              ),
              SizedBox(height: 20,),
           
              const Icon(Icons.lock , size: 100, color: Colors.grey,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
                child: Container(
                  child: Text(
                    "Votre mot de passe sera reinitialiser par Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0.4,
                      decorationStyle: TextDecorationStyle.double,
                    ),
                  ),
                ),
              ),
           
              SizedBox(height: 20,),

              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0 , vertical: 5),
                child: Text(
                  'Entrez votre adresse email',
                  style: TextStyle(color: Colors.grey[400] 
                  ,fontSize: 12 , fontWeight: FontWeight.w600
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: "Email",
                      hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                      prefixIcon: Icon(Icons.email_sharp , color: Colors.grey, )
                      )
                      ,
                ),
              ),
              
           
                ],
              ),
              
               
               
              SizedBox(height: 20,),

           
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Newpassword()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0 , vertical: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      color: Colors.indigo[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Suivant",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                                                ),
                ),
                Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          thickness: 0.5,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()) );
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Text("Retour vers la connexion? cliquez ici" ,style: TextStyle(color: Colors.grey.shade300 , fontSize: 10 , fontWeight:FontWeight.w600 ),),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          thickness: 0.5,
                                          color: Colors.grey.shade500,
                                        ),
                                      )
                                    ],
                                  ),
                        ),
           
                        
                      
            ],
           ),
         ),
        ),
      ),
    

    );
  }
}
