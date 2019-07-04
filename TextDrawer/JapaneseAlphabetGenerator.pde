import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class JapaneseAlphabetGenerator {
  
  List <String> alphabet;
  private Random rand;
  
  public JapaneseAlphabetGenerator() {
    alphabet = new ArrayList<String>();
    int initVal = Integer.parseInt("30A1", 16);
    for (int i = 0; i < 96; i++) {
      alphabet.add(Integer.toHexString(initVal + i));
    }
    rand = new Random();
  }
  
  public int raindropletLength(int maxLength) {
    return rand.nextInt(maxLength+1);
  }
  
  public boolean toRain() {
    return rand.nextInt(2) == 1 ? true : false; 
  }
}
