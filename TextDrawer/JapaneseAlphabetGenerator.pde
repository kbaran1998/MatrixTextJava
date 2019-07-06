import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class JapaneseAlphabetGenerator {
  
  private List <String> alphabet;
  private Random rand;
  
  /**
  * Japanese character generator constructor creates gets all
  * hexadecimal values for their unicode (UTF-8) representation
  * and places them into an alphabet list. Also, Java's random
  * number generator is created.
  */
  public JapaneseAlphabetGenerator(Random rand) {
    alphabet = new ArrayList<String>();
    int initVal = Integer.parseInt("30A1", 16);
    for (int i = 0; i < 96; i++) {
      alphabet.add(new String(Character.toChars(unhex(Integer.toHexString(initVal + i)))));
    }
    this.rand = rand;
  }
  
  /**
  * Random character from the alphabet.
  */
  public String getRandomCharacter() {
    return alphabet.get(rand.nextInt(96));
  }
  
  /**
  * Pobabilistic generator for generating droplet if it has not been created.
  */
  public boolean toRain(int probability) {
    return rand.nextInt(probability) == rand.nextInt(probability) ? true : false; 
  }
}
