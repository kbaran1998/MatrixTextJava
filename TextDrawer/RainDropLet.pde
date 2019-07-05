import java.util.ArrayList;
import java.util.List;
import java.util.Random;


public class Raindroplet {
  int dropletLength;
  List<String> charsList;
  float [] yCoordinates;
  JapaneseAlphabetGenerator japGen;
  Random rand;
  
  /**
  * A constuctor to the rain droplet.
  */
  public Raindroplet(int dropletLengthIn, JapaneseAlphabetGenerator japGen) {
    rand = new Random();
    this.japGen = japGen;
    this.dropletLength = rand.nextInt(dropletLengthIn+1);
    charsList = new ArrayList<String>();
    
    for (int i = 0; i < this.dropletLength; i++) {
      charsList.add(new String(Character.toChars(unhex(japGen.getRandomCharacter()))));
    }
    yCoordinates = new float [charsList.size()];
    for (int i = 0; i < this.dropletLength; i++) {
      yCoordinates[i] = (-10)*i;
    }
  }
  
  public void changeRandomLetter() {
    if (rand.nextInt(50) == 1) {
      charsList.set(rand.nextInt(charsList.size()), new String(Character.toChars(unhex(japGen.getRandomCharacter()))));
    }
  }
  
  public boolean isRainDropletDrawn() {
    if (this.yCoordinates.length == 0) {
      return false;
    }
    return this.yCoordinates[this.yCoordinates.length-1] > 0 ? true : false; 
  }
  
}
