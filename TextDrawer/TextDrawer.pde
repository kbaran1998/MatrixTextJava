import java.util.ArrayList;
import java.util.List;
import java.util.Random;


//###################################################
//# You can edit the final values to your linking ;)#
//###################################################

private final int MAX_CHAR_SPACING = 10;
private final int MAX_RAINDROPLET_LENGTH = 50;
private final int TO_RAIN_PROBABILITY = 250;
private final int CHAR_CHANGE_PROBABILITY = 100;
private final int SPEED = 3;



private JapaneseAlphabetGenerator japGen;
private List<Raindroplet> [] rainColumns;
private List<Boolean> [] drawnDroplets;
private int columnsNum;
private Random rand;


/**
 * A setup for the animation that is 1000 x 1000 pixels wide and initial objects like
 * raindrops, random number generator and Japanese character generator are created.
 * The screen is divided into columns where each column is a list of rain droplets.
 * Lengths of the rain droplets are random (with a given threshold) and characters
 * are generated randomly.
 */
void setup() {
  size(1000, 1000);
  columnsNum = width/MAX_CHAR_SPACING;
  rand = new Random();
  japGen = new JapaneseAlphabetGenerator(rand);
  rainColumns = new ArrayList[columnsNum];
  drawnDroplets = new ArrayList[columnsNum];
  for (int i = 0; i < columnsNum; i++) {
    rainColumns[i] = new ArrayList<Raindroplet>();
    rainColumns[i].add(new Raindroplet(MAX_RAINDROPLET_LENGTH, japGen, rand));
    drawnDroplets[i] = new ArrayList<Boolean>();
    drawnDroplets[i].add(false);
  }
}


/**
 * A draw function that is called every frame. Firstly, we set up the background to black so that
 * for the new frame, the old text that is drawn, disappears. Letters are set to green (RGB setting).
 * the function goes over each column and draws characters for every single rain droplet. Once a character
 * is drawn, we translate it downwards with a certain speed and a random character is changed in the rain
 * droplet. Once one whole droplet in a column is drawn, we add a new droplet and at random time period later,
 * it will appear. Also, once a droplet is invisible to us (moved beyond the animation screen), the droplet is
 * deleted.
 */
void draw() {
  background(0);
  fill(0,255,0);
  for (int columnIndex = 0; columnIndex < columnsNum; columnIndex++) {
    for (int dropletIndex = 0; dropletIndex < drawnDroplets[columnIndex].size(); dropletIndex++) {
      if (isPreviousDropletDrawnFully(dropletIndex-1, rainColumns[columnIndex])) {
        if (drawnDroplets[columnIndex].get(dropletIndex) || japGen.toRain(TO_RAIN_PROBABILITY)) {
          drawnDroplets[columnIndex].set(dropletIndex, true);  //<>//
          
          for (int i = 0; i < rainColumns[columnIndex].get(dropletIndex).getDropletLetters().size(); i++) {
             text(rainColumns[columnIndex].get(dropletIndex).getDropletLetters().get(i),
               columnIndex*MAX_CHAR_SPACING, rainColumns[columnIndex].get(dropletIndex).getYCoordinatesList()[i]);
             rainColumns[columnIndex].get(dropletIndex).getYCoordinatesList()[i] += SPEED;
             rainColumns[columnIndex].get(dropletIndex).changeRandomLetter(CHAR_CHANGE_PROBABILITY);
          }
          
          if (isDropletCompletlyDrawnOnScreen(columnIndex, dropletIndex)) {
             rainColumns[columnIndex].add(new Raindroplet(MAX_RAINDROPLET_LENGTH, japGen, rand));
             drawnDroplets[columnIndex].add(false);
          }
          
          if (isDropletOutOfSight(columnIndex, dropletIndex)) {
             drawnDroplets[columnIndex].remove(dropletIndex);
             rainColumns[columnIndex].remove(dropletIndex);
          }
        }
      }
    }
  }
}

/**
 * A check to see if the previous droplet is fully visible on the screen.
 * @param previousDropletIndex  index of the previous droplet
 * @param dropletList  list of droplets for a given column
 * @return boolean value if the previous droplet was drawn fully
 */
public boolean isPreviousDropletDrawnFully(int previousDropletIndex, List<Raindroplet> dropletList) {
  if (previousDropletIndex < 0) {
    return true;
  }
  return dropletList.get(previousDropletIndex).isRainDropletDrawn();
}

/**
 * A check to see if the current droplet is fully drawn.
 * @param columnIndex  index of the column
 * @param dropletIndex  index of the droplet from a list
 * @return boolean value of whether the previous droplet was drawn fully
 */
public boolean isDropletCompletlyDrawnOnScreen(int columnIndex, int dropletIndex) {
  return rainColumns[columnIndex].get(dropletIndex).isRainDropletDrawn();
}

/**
 * A check that sees if a rain droplet is out of sight from the screen.
 * @param columnIndex  index of the column
 * @param dropletIndex  index of the droplet from a list
 * @return boolean value of whether rain droplet is out of sight
 */
public boolean isDropletOutOfSight(int columnIndex, int dropletIndex) {
  return rainColumns[columnIndex].get(dropletIndex).getYCoordinatesList()[rainColumns[columnIndex].get(dropletIndex).getYCoordinatesList().length-1] > height;
}
