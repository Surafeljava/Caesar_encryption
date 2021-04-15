class CaesarEnc{

  static String getEncryptedString(String value, int shift){

    String encrypted = "";

    for (int i = 0; i < value.length; i++) {

      if(value[i].toUpperCase()==value[i]){
        int charCode = value.codeUnitAt(i);

        int newCharCode = (charCode + shift - 65) % 26 + 65;
        String val = String.fromCharCode(newCharCode);
        encrypted += val;
      }else{
        int charCode = value.codeUnitAt(i);

        int newCharCode = (charCode + shift - 97) % 26 + 97;
        String val = String.fromCharCode(newCharCode);
        encrypted += val;
      }

    }

    return encrypted;

  }

}