//Conway's Game of Life
//Any live cell with two or three live neighbours survives.
//Any dead cell with three live neighbours becomes a live cell.
//All other live cells die in the next generation. Similarly, all other dead cells stay dead.

int cell_size = 5;
int time = 0;
ArrayList<int[]> living_cell = new ArrayList<int[]>();
ArrayList<int[]> new_living_cell = new ArrayList<int[]>();
int frame = 500;

void setup(){
  size(1000, 1000);
  background(0);
  frameRate(frame);
}

void draw(){
  background(0);
  
  //INITIATION OF LIVING CELL
  if (time == 0){
    initLivingCell();
    for (int x = 0; x < height/cell_size; x ++){
     for (int y = 0; y < width/cell_size; y ++){  
       for (int[] cell : living_cell){
         if (cell[0] == x && cell[1] == y){
           //random color
           color c = color(0, noise(y,x) * 255, noise(x,y) * 255); //random color for each living cell 
           noStroke();
           fill(c);
           rect(x*cell_size, y*cell_size, cell_size, cell_size);
         }
       } 
      }
    }
    time += 1;
  }
  //AFTER INITIATION
  else {
    
    for (int x = 0; x < height/cell_size; x ++){
      for (int y = 0; y < width/cell_size; y ++){  
        //First determine if the cell is previously dead/live
        boolean isLive = false;
        for (int[] cell : living_cell){
          if (cell[0] == x && cell[1] == y){
            isLive = true;
          }
        }
        
        int[] x_sur = {x-1, x, x+1}; 
        int[] y_sur = {y-1, y, y+1};
        ArrayList<int[]> sur = new ArrayList<int[]>();
        
        for (int x0 : x_sur){
          for (int y0 : y_sur){
            if (x0 == x && y0 == y){
              continue;
            }
            else{
             int[] sur_point = {x0, y0};
             sur.add(sur_point);
            }
          }
        }
        
        
        //if dead, check if it should be live 
        
        if (!isLive){ //cell was previously dead
          int count_dead = 0; //how many celsl were live around the dead center cell
          for (int[] sur_point : sur){
            for (int[] cell : living_cell){
              if (cell[0] == sur_point[0] && cell[1] == sur_point[1]){
              count_dead += 1;
              }
            }
          }
          if (count_dead == 3){
            color c = color(0, noise(y,x) * 255, noise(x,y) * 255); //random color for each living cell 
            noStroke();
            fill(c);
            rect(x*cell_size, y*cell_size, cell_size, cell_size);
            int[] new_cell = {x, y};
            new_living_cell.add(new_cell);
          }
          //else: no need to draw the rect
        }
        else{ //cell was previously alive
          int count_live = 0; //count how many cells were alive around the living center cell
          for (int[] sur_point : sur){
            for (int[] cell : living_cell){
              if (cell[0] == sur_point[0] && cell[1] == sur_point[1]){
              count_live += 1;
              }
            }
          }
          if (count_live == 2 || count_live == 3){
            color c = color(0, noise(y,x) * 255, noise(x,y) * 255); //random color for each living cell 
            noStroke();
            fill(c);
            rect(x*cell_size, y*cell_size, cell_size, cell_size);
            int[] new_cell = {x, y};
            new_living_cell.add(new_cell);
          }
          //else: no need to draw the rect
        }
      }
    }
    time += 1;
    living_cell = new_living_cell;
    new_living_cell = new ArrayList<int[]>();
    println(time);
  }
}

void initLivingCell(){
  //INITITA STATE
  int[] number1 = {100, 100};
  living_cell.add(number1);
  
  int[] number2 = {101, 100};
  living_cell.add(number2);
  
  int[] number3 = {101, 102};
  living_cell.add(number3);
  
  int[] number4 = {103, 101};
  living_cell.add(number4);
  
  int[] number5 = {104, 100};
  living_cell.add(number5);
  
  int[] number6 = {105, 100};
  living_cell.add(number6);
  
  int[] number7 = {106, 100};
  living_cell.add(number7);
}
