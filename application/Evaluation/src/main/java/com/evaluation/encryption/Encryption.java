
package com.evaluation.encryption;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
 
// μπορει να μπει ότι θέλουμε μεταξυ MD2, MD5, SHA-1, SHA-224, SHA-256, SHA-384, SHA-512 //

public class Encryption {
         public static String getHash (String password) {
  try {
   MessageDigest messageDigest = MessageDigest.getInstance("MD5");
   
   messageDigest.update(password.getBytes());
   
   byte[] resultByteArray = messageDigest.digest();
   
   StringBuilder sb = new StringBuilder();
   
   for (byte b : resultByteArray) {
    sb.append(String.format("%02x", b));
   }
   
   return sb.toString();
   
  } catch (NoSuchAlgorithmException e) {
   e.printStackTrace();
  }
  
  return "";
 }
 
}
