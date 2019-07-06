import java.util.ArrayList;
import java.util.List;
import java.util.Random;


public class Raindroplet {
  
  private int dropletLength;
  private List<String> japaneseCharList;
  private float [] yCoordinates;
  private JapaneseAlphabetGenerator japGen;
  private Random rand;
  
  /**
  * A constuctor to the rain droplet.
  * @param dropletLengthMax  maximum threshold for a droplet length
  * @param japGen  japanese character generator
  * @param rand  random number generator
  */
  public Raindroplet(int dropletLengthMax, JapaneseAlphabetGenerator japGen, Random rand) {
    this.rand = rand;
    this.japGen = japGen;
    int random = raindropletLength(dropletLengthMax);
    this.dropletLength = random == 0 ? 1 : random;
    japaneseCharList = new ArrayList<String>();
    yCoordinates = new float [this.dropletLength];
    for (int i = 0; i < this.dropletLength; i++) {
      japaneseCharList.add(japGen.getRandomCharacter());
      yCoordinates[i] = (-10)*i;
    }
  }
  
  /**
  * Getter method for droplet letters.
  * @return characters list for a droplet.
  */
  public List<String> getDropletLetters() {
    return japaneseCharList;
  }
  
  /**
  * Getter method for droplet letters' y coordinates.
  * @return array letters' y coordinates.
  */
  public float [] getYCoordinatesList() {
    return yCoordinates;
  }
  
  /**
  * A method to change a random character in the droplet to any random character.
  * Two random numbers have to be the same in 1 method call, hence the probability
  * is a approximately 1 / (probability * probability) (read up Random class
  * implementation for more details, I was too lazy .... ;) ).
  * @param probability  probability value
  */
  public void changeRandomLetter(int probability) {
    if (rand.nextInt(probability) == rand.nextInt(probability)) {
      japaneseCharList.set(rand.nextInt(japaneseCharList.size()), japGen.getRandomCharacter());
    }
  }
  
  /**
  * Chekck is a given rain droplet is drawn by checking the last character being
  * in position higehr than 0.
  * @return boolean value that decides if a rain droplet is drawn
  */
  public boolean isRainDropletDrawn() {
    if (this.yCoordinates.length == 0) {
      return false;
    }
    return this.yCoordinates[this.yCoordinates.length-1] > 0 ? true : false; 
  }
  
  /**
  * A method that returns random length for a droplet with a maximum length (inclusive).
  * @param maxLength  maximum threshold for a raindroplet
  * @return  random length
  */
  public int raindropletLength(int maxLength) {
    return this.rand.nextInt(maxLength+1);
  }
}
