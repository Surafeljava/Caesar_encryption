import 'package:caesarencryption/caesar_enc.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController textEditingController = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool validate = false;

  int shift = 3;

  String encrypted = "";

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
            autovalidate: validate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Text('Caesar Encryption', style: TextStyle(color: Colors.grey[800], fontSize: 28.0, fontWeight: FontWeight.w600, letterSpacing: 1.0),),
                SizedBox(height: 20.0,),
                Text('$encrypted', style: TextStyle(color: Colors.grey[700], fontSize: 20.0, fontWeight: FontWeight.w400, letterSpacing: 1.0),),
                Spacer(),
                Text('Shift By:', style: TextStyle(color: Colors.grey[700], fontSize: 18.0, fontWeight: FontWeight.w400, letterSpacing: 1.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.redAccent, size: 30.0,),
                      onPressed: (){
                        if(shift>2){
                          setState(() {
                            shift -= 1;
                          });
                        }else{
                          setState(() {
                            shift = shift;
                          });
                        }
                      },
                    ),
                    SizedBox(width: 10.0,),
                    Text('$shift', style: TextStyle(color: Colors.grey[800], fontSize: 30.0, fontWeight: FontWeight.w500, letterSpacing: 1.0),),
                    SizedBox(width: 10.0,),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.blue, size: 30.0,),
                      onPressed: (){
                        if(shift<25){
                          setState(() {
                            shift += 1;
                          });
                        }else{
                          setState(() {
                            shift = shift;
                          });
                        }
                      },
                    ),
                  ],
                ),

                SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                    controller: textEditingController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Type here'
                    ),
                    validator: (val){

                      if(val.isEmpty){
                        return "Please enter your text first";
                      }else{
                        for(int i = 0; i < val.length; i++){
                          if(isNumeric(val[i])){
                            return "Don't use number";
                          }
                        }
                        return null;
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
                      child: Text('Encrypt'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 1.0),),
                    ),
                    onPressed: (){

                      setState(() {
                        validate = true;
                      });


                      if(_formKey.currentState.validate()){

                        String enc = CaesarEnc.getEncryptedString(textEditingController.text, shift);

                        setState(() {
                          encrypted = enc;
                        });

                      }else{
                        final snackBar = SnackBar(content: Text("Please check ur input"));
                        _scaffoldKey.currentState.showSnackBar(snackBar);
                      }
                    },
                  ),
                ),

                Spacer(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
