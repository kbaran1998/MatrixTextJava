import java.util.ArrayList;
import java.util.List;
import java.util.Random;

private final int MAX_CHAR_SPACING = 10;
private final int MAX_RAINDROPLET_LENGTH = 50;
private final int TO_RAIN_PROBABILITY = 250;
private final int CHAR_CHANGE_PROBABILITY = 100;


private JapaneseAlphabetGenerator japGen;
private List<Raindroplet> [] rainList;
private List<Boolean> [] drawnDroplets;
private int columnsNum;
private Random rand;



void setup() {
  size(1000, 1000);
  columnsNum = width/MAX_CHAR_SPACING;
  rand = new Random();
  japGen = new JapaneseAlphabetGenerator(rand);
  rainList = new ArrayList[columnsNum];
  drawnDroplets = new ArrayList[columnsNum];
  for (int i = 0; i < columnsNum; i++) {
    rainList[i] = new ArrayList<Raindroplet>();
    rainList[i].add(new Raindroplet(MAX_RAINDROPLET_LENGTH, japGen, rand));
    drawnDroplets[i] = new ArrayList<Boolean>();
    drawnDroplets[i].add(false);
  }
}



void draw() {
  background(0);
  fill(0,255,0);
  for (int columnIndex = 0; columnIndex < columnsNum; columnIndex++) {
    for (int dropletIndex = 0; dropletIndex < drawnDroplets[columnIndex].size(); dropletIndex++) {
      if (isPreviousDropletDrawnFully(dropletIndex-1, rainList[columnIndex])) {
        if (drawnDroplets[columnIndex].get(dropletIndex) || japGen.toRain(TO_RAIN_PROBABILITY)) {
          drawnDroplets[columnIndex].set(dropletIndex, true);  //<>//
          
          for (int i = 0; i < rainList[columnIndex].get(dropletIndex).getDropletLetters().size(); i++) {
             text(rainList[columnIndex].get(dropletIndex).getDropletLetters().get(i), columnIndex*MAX_CHAR_SPACING, rainList[columnIndex].get(dropletIndex).getYCoordinatesList()[i]);
             rainList[columnIndex].get(dropletIndex).getYCoordinatesList()[i] += 3;
             rainList[columnIndex].get(dropletIndex).changeRandomLetter(CHAR_CHANGE_PROBABILITY);
          }
          
          if (isDropletCompletlyDrawnOnScreen(columnIndex, dropletIndex)) {
             rainList[columnIndex].add(new Raindroplet(MAX_RAINDROPLET_LENGTH, japGen, rand));
             drawnDroplets[columnIndex].add(false);
          }
          
          if (isDropletOutOfSight(columnIndex, dropletIndex)) {
             drawnDroplets[columnIndex].remove(dropletIndex);
             rainList[columnIndex].remove(dropletIndex);
          }
        }
      }
    }
  }
}

public boolean isPreviousDropletDrawnFully(int previousDropletIndex, List<Raindroplet> dropletList) {
  if (previousDropletIndex < 0) {
    return true;
  }
  return dropletList.get(previousDropletIndex).isRainDropletDrawn();
}

public boolean isDropletCompletlyDrawnOnScreen(int columnIndex, int dropletIndex) {
  return rainList[columnIndex].get(dropletIndex).isRainDropletDrawn();
}

public boolean isDropletOutOfSight(int columnIndex, int dropletIndex) {
  return rainList[columnIndex].get(dropletIndex).getYCoordinatesList()[rainList[columnIndex].get(dropletIndex).getYCoordinatesList().length-1] > height;
}
