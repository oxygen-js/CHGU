Fdata fd;

fd.x0 = 1; 
fd.y0 = 1;
fd.color = 0x2727FF;
fd.type = Figures.Romb;


enum Figures
{
  Romb,
  Circle, 
  Rect
}


struct Fdata
{
  public int x0, y0;
  public int color;
  public Figures type;
}