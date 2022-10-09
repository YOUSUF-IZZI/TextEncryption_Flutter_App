class EnctyptionDycryption {

  String encryption(String mesaj, int key) {
    int ascii = 0;
    String sifrelenmisMesaj = '';
    int temp = 0;
    for (int i = 0; i < mesaj.length; i++) {
      temp = (mesaj.codeUnitAt(i) - 97);
      if (temp < 0) {
        ascii = 32 + key;
      }
      else
        ascii = ((((temp + key)) % 26) + 97);
      sifrelenmisMesaj += String.fromCharCode(ascii);
    }
    return sifrelenmisMesaj;
  }

  String decryption(String sifrelenmisMesaj, int key) {
    int ascii = 0;
    String orginalMesaj = '';
    int temp = 0;
    for (int i = 0; i < sifrelenmisMesaj.length; i++) {
      temp = (sifrelenmisMesaj.codeUnitAt(i) - 97);
      if (temp < 0) {
        ascii = 32;
      }
      else
        ascii = ((((temp - key)) % 26) + 97);
      orginalMesaj += String.fromCharCode(ascii);
    }
    return orginalMesaj;
  }
}