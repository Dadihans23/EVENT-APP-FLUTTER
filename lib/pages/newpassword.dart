import 'package:flutter/material.dart';


class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

 final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool isObscure =true;


class _NewpasswordState extends State<Newpassword> {
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
                  " REINITIALISATION DE MOT DE PASSE ",
                  textAlign: TextAlign.center,   
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
                    "Veuillez reinitialiser votre mot de passe ",
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

              Padding(
                padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 25.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: isObscure,
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
                      hintText: "Nouveau mot de passe",
                      hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                      prefixIcon: Icon(Icons.password , color: Colors.grey, ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure; // Inverse l'état de l'obfuscation lorsque l'icône est cliquée.
                          });
                        },
                      ),
                          ),
                ),
              ) ,
              Padding(
                padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 25.0),
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: isObscure,
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
                      hintText: "Confirmez votre mot de passe",
                      hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                      prefixIcon: Icon(Icons.password , color: Colors.grey, ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure; // Inverse l'état de l'obfuscation lorsque l'icône est cliquée.
                          });
                        },
                      ),
                          ),
                ),
              ) ,
               
               
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
            ],
           ),
         ),
        ),
      ),
    

    );
  }
}