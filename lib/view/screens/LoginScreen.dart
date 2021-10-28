import 'package:chauffeur_app/controller/LoginController.dart';
import 'package:chauffeur_app/entity/User.dart';
import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:chauffeur_app/view/screens/HomeScreen.dart';
import 'package:chauffeur_app/view/screens/SignUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget
{

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {

  final RoundedLoadingButtonController _btnControllerInfo = RoundedLoadingButtonController();

  String cin = "",mdp = "";
  void signUpTapped()
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));

  }
  void signInTapped() async
  {
   var result = await LoginController.instance.SignInChauffeur(cin, mdp);

   showLoginResult(String message)
   {
     showDialog(
       context: context,
       builder: (context) {
         return  AlertDialog(
           title: new Text(message),
           actions: <Widget>[
              TextButton(
               onPressed: () => Navigator.of(context).pop(false),
               child: new Text('Réessayer'),
             )
           ],
         );
       },
     );
   }

   if(result is User)
     {
        User user = result as User;
       print("User ok");
       _btnControllerInfo.reset();
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(user)), (Route<dynamic> route) => false);
     }else if(result is int)
       {
       if((result as int) == 402)
         {
            showLoginResult("Votre compte n'est verifier par un admin");
            _btnControllerInfo.reset();

         }else if((result as int) == 403)
           {
             showLoginResult("Ce compte a été désactiver par son propriétaire");
             _btnControllerInfo.reset();

           }else if((result as int) == 404)
       {

         showLoginResult("Cin ou mot de passe incorrect, prière de vérifier vos coordonnées");
         _btnControllerInfo.reset();

       }

       }else {
       showLoginResult("une erreur s'est produite réessayer plus tard");
       _btnControllerInfo.reset();


   }

  }


  @override
  void initState() {
    super.initState();


  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:StafimColors.BACKGROUND_COLOR_SIGNIN,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text("STAFIM",style:TextStyle(
                        fontFamily: "peugeot-regular",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 32
                    )
                    )
                  ],
                ),


                Row(
                  children: [
                    SizedBox(width: 5,),
                    Image(image:  AssetImage("assets/images/peugeot.png"),width: 32,height: 32,),
                    Text("PEUGEOT",style:TextStyle(
              fontFamily: "peugeot-regular",
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ))

                  ],
                ),


              ],
            ),

            SizedBox(height: 20,),

            Card(

              child:  Padding(
                padding: EdgeInsets.only(top: 5,bottom: 20),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                      child: Text("Se connecter:",style: TextStyle(
                        fontFamily: "peugeot-bold",
                        fontSize: 22,
                        color: Colors.black,
                      )
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Form(
                                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Container(
                                            decoration: new BoxDecoration(
                                              border: new Border(
                                                bottom: new BorderSide(
                                                  width: 0.5,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            child: new TextFormField(
                                              obscureText: false,


                                                onChanged: (value){

                                                setState(() {
                                                this.cin = value;
                                                });
                                                },

                                                style: const TextStyle(
                                                fontFamily: "peugeot-regular",
                                                color: Colors.black,
                                              ),
                                               decoration: new InputDecoration(
                                                icon: new Icon(
                                                  Icons.person_outline,
                                                  color: Colors.black,
                                                ),
                                                border: InputBorder.none,
                                                hintText: "Cin",
                                                hintStyle: const TextStyle(color: Colors.black26, fontSize: 15.0),
                                                contentPadding: const EdgeInsets.only(
                                                    top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: new BoxDecoration(
                                              border: new Border(
                                                bottom: new BorderSide(
                                                  width: 0.5,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            child: new TextFormField(
                                              obscureText: true,



                                              onChanged: (value){

                                                setState(() {
                                                  this.mdp = value;
                                                });

                                              },
                                              style: const TextStyle(
                                                fontFamily: "peugeot-regular",
                                                color: Colors.black,
                                              ),
                                              decoration: new InputDecoration(
                                                icon: new Icon(
                                                  Icons.lock_outline,
                                                  color: Colors.black,
                                                ),
                                                border: InputBorder.none,
                                                hintText: "Mot de passe",
                                                hintStyle: const TextStyle(color: Colors.black26, fontSize: 15.0),
                                                contentPadding: const EdgeInsets.only(
                                                    top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
                                              ),
                                            ),
                                          )

                                        ],

                                      ))],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top:20),
                              child:Row(

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(

                                    width: 120.0,
                                    height: 40.0,
                                    child: RoundedLoadingButton(

                                      child: Text('Se connecter', style: TextStyle(fontFamily: "peugeot-regular",fontSize: 12,color: Colors.white)),
                                      controller: _btnControllerInfo,
                                      onPressed: signInTapped,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 20,),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text("Ou ",style: TextStyle(fontFamily: "peugeot-regular",fontSize: 12,color: Colors.black),),GestureDetector(
                              onTap: signUpTapped,
                              child: Text(
                                "inscrivez-vous",
                                style: TextStyle(fontFamily: "peugeot-regular",fontSize: 12,color: Colors.black,decoration: TextDecoration.underline),
                              ),
                            ),Text(" maintenant",style: TextStyle(fontFamily: "peugeot-regular",fontSize: 12,color: Colors.black),)])
                          ],
                        )],
                    )


                  ],


                ),

              ),
            ),


          ],),)
    );

  }
}
