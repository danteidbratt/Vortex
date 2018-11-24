class Color {
   int value;
   boolean direction;
   
   Color(int value, boolean direction) {
     this.value = value;
     this.direction = direction;
   }
   
   int getValue() {
     value += direction ? 1 : -1; 
     if (value == 255 || value == 0) {
       direction = !direction;
     }
     return value;
   }
}
