class CaesarEnc{

  static void getEncryptedString(String value){

    String s = "Hello World";

    for (int i = 0; i < s.length; i++) {
      print("Code unit for ${s[i]} is ${s.codeUnitAt(i)}");
    }

    print("Code unit list ${s.codeUnits}");


  }

}