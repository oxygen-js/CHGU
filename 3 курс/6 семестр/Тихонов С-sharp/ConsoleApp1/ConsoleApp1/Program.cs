int result = 0;

for (int i = 0; i < args.Length; i++)
{
  if (int.TryParse(args[i], out var number))
  {
    result += number;
  }
}

Console.WriteLine($"Result - {result}");
