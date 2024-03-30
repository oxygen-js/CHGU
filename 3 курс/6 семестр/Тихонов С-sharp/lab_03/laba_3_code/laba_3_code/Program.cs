try
{
  if (args.Length > 2 || args.Length <= 1)
  {
    throw new Exception("The number of parameters exceeded");
  }

  for (int i = 0; i < args.Length; i++)
  {
    if (!(int.TryParse(args[i], out var num)))
    {
      throw new Exception("The parameter is not a number");
    } 
  }
    
} 
catch(Exception ex)
{
  Console.WriteLine(ex.ToString());
}


var rand = new Random();
double[,] matrix = new double[int.Parse(args[0]), int.Parse(args[1])];
int rows = int.Parse(args[0]);
int columns = int.Parse(args[1]);

for (int i = 0; i < rows; ++i)
{
  for (int j = 0; j < columns; ++j)
  { 
    setValue(out matrix[i, j]);
  }
}

printMatrix(matrix);

double mean = 0;
getMeanSideDiagonalMatrix(ref mean, ref matrix);

Console.WriteLine($"Среднее арифметическое элементов побочной диагонали: {mean}");

void getMeanSideDiagonalMatrix(ref double res, ref double[,] arr)
{
  double diagonalSum = 0;
  int diagonalCount = 0;

  for (int i = 0; i < arr.GetLength(0); i++)
  {
    for (int j = 0; j < arr.GetLength(1); j++)
    {
      if (i + j == arr.GetLength(0) - 1)
      {
        diagonalSum += arr[i, j];
        diagonalCount++;
      }
    }
  }

  res = diagonalSum / diagonalCount;
}

void printMatrix(double[,] arr)
{
  for (int i = 0; i < rows; i++)
  {
    for (int j = 0; j < columns; j++)
    {
      Console.Write(arr[i, j] + "\t ");
    }
    Console.WriteLine();
  }
}

void setValue(out double values)
{
  values = Math.Round(rand.Next(-100, 100) - rand.NextDouble(), 1);
}
