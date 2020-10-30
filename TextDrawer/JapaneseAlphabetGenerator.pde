import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class JapaneseAlphabetGenerator {
  
  private List <String> alphabet;
  private Random rand;
  
  /**
  * Japanese character (Katakana) generator constructor creates gets all
  * hexadecimal values for their unicode (UTF-8) representation
  * and places them into an alphabet list. Also, Java's random
  * number generator is created.
  * @param rand  random number generator
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
  * Generates a random character from the (Katakana) alphabet.
  * @return random letter
  */
  public String getRandomCharacter() {
    return alphabet.get(rand.nextInt(96));
  }
  
  /**
  * Pobabilistic decider to decide whether to generate droplet or not.
  * Two random numbers have to be the same in 1 method call, hence the probability
  * is a approximately 1 / (probability * probability) (read up Random class
  * implementation for more details, I was too lazy .... ;) ).
  * @param probability  probability value
  * @return decision whether to draw a new droplet (once the other droplets in its row are drawn)
  */
  public boolean toRain(int probability) {
    return rand.nextInt(probability) == rand.nextInt(probability); 
  }
}
