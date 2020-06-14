#include <femtorv32.h>

static int scrolling = 0;
static int cursor_X = 0;
static int cursor_Y = 0;
static int display_start_line = 0;

void GL_tty_init() {
    oled_init();
    oled_clear();
    set_putcharfunc(GL_putchar);
    cursor_X = 0;
    cursor_Y = 0;
    scrolling = 0;
    display_start_line = 0;
    oled1(0xA1, 0); /* reset display start line. */
}

void GL_tty_scroll() {
    /* Using SSD1351 'display start line' command, we 
       can scroll the terminal without memorizing the 
       contents anywhere !                             */ 
    scrolling = scrolling || (cursor_Y >= 16);
    if(!scrolling) {
	return;
    }
    cursor_Y = cursor_Y & 15;
    /* clear line */    
    oled_clear_rect(0,cursor_Y*8,127,cursor_Y*8+7); 
    oled1(0xA1, display_start_line & 127);
    display_start_line += 8;
}

int GL_putchar(int c) {
    if(c == '\n') {
	cursor_X = 0;
	++cursor_Y;
	GL_tty_scroll();
	return c;
    }
    GL_putchar_xy(cursor_X*6, cursor_Y*8, (char)c); 
    ++cursor_X;
    if(cursor_X >= 21) {
	GL_putchar('\n');
    }
    return c;
}

void GL_putchar_xy(int X, int Y, char c) {
   oled_write_window(X,Y,X+5,Y+7);
   unsigned int chardata = ((unsigned int*)font_5x6)[c - ' '];
   int shifted = chardata & (1 << 30);
   for(int row=0; row<8; ++row) {
       for(int col=0; col<6; ++col) {
	   uint32_t BW;
	   if(col >= 5) {
	       BW = 0;
	   } else {
	       unsigned int coldata = (chardata >> (6 * col)) & 63;
	       if(shifted) {
		   coldata = coldata << 2;
	       }
	       BW = (coldata & (1 << row)) ? 255 : 0;
	   }
	   IO_OUT(IO_OLED_DATA,BW);
	   oled_wait();
	   IO_OUT(IO_OLED_DATA,BW);
	   oled_wait();
       }
   }

/*   
   char* car_ptr = font_8x8 + (int)c * 8;
   for(int row=0; row<8; ++row) {
      for(int col=0; col<8; ++col) {
	 uint32_t BW = (car_ptr[col] & (1 << row)) ? 255 : 0;
	 IO_OUT(IO_OLED_DATA,BW);
	 oled_wait();
	 IO_OUT(IO_OLED_DATA,BW);
	 oled_wait();
      }
   }
*/   
}

		