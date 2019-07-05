import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class JapaneseAlphabetGenerator {
  
  List <String> alphabet;
  private Random rand;
  
  /**
  * Japanese character generator constructor creates gets all
  * hexadecimal values for their unicode (UTF-8) representation
  * and places them into an alphabet list. Also, Java's random
  * number generator is created.
  */
  public JapaneseAlphabetGenerator() {
    alphabet = new ArrayList<String>();
    int initVal = Integer.parseInt("30A1", 16);
    for (int i = 0; i < 96; i++) {
      alphabet.add(Integer.toHexString(initVal + i));
    }
    rand = new Random();
  }
  
  /**
  * Random character from the alphabet.
  */
  public String getRandomCharacter() {
    return alphabet.get(rand.nextInt(96));
  }
  
  /**
  * Random length for a droplet with a maximum length (inclusive).
  */
  public int raindropletLength(int maxLength) {
    return rand.nextInt(maxLength+1);
  }
  
  /**
  * Pobabilistic generator for generating droplet if it has not been created.
  */
  public boolean toRain() {
    return rand.nextInt(2) == 1 ? true : false; 
  }
}
