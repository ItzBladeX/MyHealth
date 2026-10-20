import 'package:bcrypt/bcrypt.dart'; 

String hashPassword(String rawPassword) {
 
  final String salt = BCrypt.gensalt(); 

  return BCrypt.hashpw(rawPassword, salt);
}

bool verifyPassword(String plainPassword, String hashedPassword) {
  return BCrypt.checkpw(plainPassword, hashedPassword);
}
