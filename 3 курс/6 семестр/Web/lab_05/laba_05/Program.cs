Bird defaultBird = new Bird();
Bird eagle = new Bird("Eagle", 5.5, 4.1, true);
Bird crow = new Bird("Crow", 2.5, 2.8, true);
Bird chicken = new Bird("Chicken", 1.5, 4.8, false);

defaultBird.PrintInfo();
eagle.PrintInfo();
crow.PrintInfo();
chicken.PrintInfo();

chicken.Predator = true;
chicken.PrintInfo();

Bird eagleChiken = eagle + chicken;
eagleChiken.PrintInfo();

Console.WriteLine($"{eagle.Species} > {chicken.Species} = {eagle > chicken}");
Console.WriteLine($"{eagle.Species} < {chicken.Species} = {eagle < chicken}");

class Bird
{
  public string Species;    // Вид
  public double Age;        // Возраст
  public double Weight;     // Вес
  
  private bool _predator;    // Хищник
  private string _diet;      // Рацион питания 

  public bool Predator
  {
    get => _predator;
    set
    {
      _predator = value;
      _diet = (value ? "meat" : "greenery");
    }
  }

  public Bird()
  {
    Species = "Default bird";
    Age = 0;
    Weight = 0;
    _predator = false;
    _diet = "greenery";
  }

  public Bird(string species, double age, double weight, bool predator)
  {
    Species = species;
    Age = age;
    Weight = weight;
    Predator = predator;
  }

  public void PrintInfo()
  {
    Console.SetCursorPosition((Console.WindowWidth - Species.Length) / 2, Console.CursorTop);
    Console.WriteLine($"*** {Species.ToUpper()} ***");
    
    Console.WriteLine("Публичные свойства");
    Console.WriteLine($"\t- Возраст: {Age}");
    Console.WriteLine($"\t- Вес: {Weight}");
    
    Console.WriteLine("");
    
    Console.WriteLine("Приватные свойства");
    Console.WriteLine($"\t- Хищник: {_predator}");
    Console.WriteLine($"\t- Рацион питания: {_diet}");

    Console.WriteLine("\n");
  }
  
  public static Bird operator + (Bird bird1, Bird bird2)
  {
    return new Bird(bird1.Species + " " + bird2.Species, 0.1, bird1.Weight + bird2.Weight, bird1.Predator);
  }

  public static bool operator > (Bird bird1, Bird bird2)
  {
    return bird1.Age > bird2.Age;
  }
  
  public static bool operator < (Bird bird1, Bird bird2)
  {
    return bird1.Age < bird2.Age;
  }
}
