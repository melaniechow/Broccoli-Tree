// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

/*
facilitates progress of tower minigame (helper method for draw)
 */
void miniGame()
{
  // Implementation (after completion of MVP)
}
int _blocksize=20;
String[][] map = new String[32][32];
Character player = new Player(null);
int screen=0; //determines what is being shown on the screen 0=start 1=pacman 2=tower, etc
PImage img; //startscreen

void setup() {
  size(680, 720);
  background(0, 0, 0);
  setMap();
  img=loadImage("tempstart.jpg");
}

void draw() {
  if (screen==0){
    image(img,0,0);
  }
  if (screen==1){
    background(0,0,0);
    drawMap();
  }
}

void mouseClicked(){
  screen=1;
}

void setMap() {
  String[] lines = loadStrings("maze.txt");
  //println("there are " + lines.length + " lines");
  for (int r = 0; r < lines.length; r++) {
    for (int c = 0; c < lines.length; c++) {
      //println(lines[r].substring(c,c+1));
      map[r][c] = lines[r].substring(c, c+1);
    }
  }
}
void drawMap() {
  for (int a = 0; a < map.length; a ++) {
    for (int b = 0; b < map[0].length; b++) {
      //power pellets
      if ( map[a][b].equals("p")) {
        //stroke(255, 255, 0);
        noStroke();
        fill(255, 255, 0);
        ellipse(b*_blocksize+_blocksize/2, a*_blocksize+75+_blocksize/2, _blocksize/2, _blocksize/2);
      } 
      //normal dots
      else if (map[a][b].equals("d")) {
        noStroke();
        fill(255, 182, 193);
        ellipse(b*_blocksize+_blocksize/2, a*_blocksize+75+_blocksize/2, 4, 4);
      } 
      //broccoli tree
      else if (map[a][b].equals("t")) {
        //stroke(255, 0, 0);
        fill(255, 0, 0);
        rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
      } 
      //start point
      else if (map[a][b].equals("@")) {
        fill(255, 255, 255);
        ellipse(b*_blocksize+_blocksize/2, a*_blocksize+75+_blocksize/2, _blocksize, _blocksize);
        player.xPos = a;
        player.yPos = b;
      }
      //eaten dot space or place you have been
      else if (map[a][b].equals("x")) {
        fill(0, 0, 0);
        rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
      }
      //walls
      else {
        //stroke(0, 0, 255);
        fill(0, 0, 255);
        rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
      }
    }
  }
}