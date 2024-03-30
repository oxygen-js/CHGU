using System.Text;

Console.WriteLine("Enter number: ");
int value = int.Parse(Console.ReadLine());

string result = intToBinary(value);
Console.WriteLine($"Result - {result}");

string intToBinary(int num)
{
  StringBuilder stringBuilder = new StringBuilder();
  
  for (int i = 0; i < 32; ++i)
  {
    stringBuilder.Append((num & 1) == 1 ? '1' : '0');
    num = num >> 1;
    if (i == 7 || i == 15 || i == 23)
    {
      stringBuilder.Append(' ');
    }
  }
  return new string(stringBuilder.ToString().Reverse().ToArray());
}
