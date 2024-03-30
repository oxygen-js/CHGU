Bird Eagle = new Bird("Eagle", 5.5, 4.1, true);
Bird Crow = new Bird("Crow", 2.5, 2.8, true);
Bird Chicken = new Bird("Chicken", 1.5, 4.8, false);

Eagle.printInfo();
Crow.printInfo();
Chicken.printInfo();


class Bird
{
  public string species;    // Вид
  public double age;        // Возраст
  public double weight;     // Вес
  
  private bool predator;    // Хищник
  private string diet;      // Рацион питания 

  public bool Predator 
  {
    get { return predator; }

    set
    {
      predator = value;
      diet = (value ? "meat" : "greenery");
    }
  }

  public Bird()
  {
    species = "Default bird";
    age = 0;
    weight = 0;
    predator = false;
    diet = "greenery";
  }

  public Bird(string species, double age, double weight, bool predator)
  {
    this.species = species;
    this.age = age;
    this.weight = weight;
    Predator = predator;
  }

  public void printInfo()
  {
    Console.SetCursorPosition((Console.WindowWidth - species.Length) / 2, Console.CursorTop);
    Console.WriteLine($"*** {species.ToUpper()} ***");
    
    Console.WriteLine($"Публичные свойства:");
    Console.WriteLine($"Возраст: {age}");
    Console.WriteLine($"Вес: {weight}");
    
    Console.WriteLine($"\nПриватные свойства:");
    Console.WriteLine($"Хищник: {predator}");
    Console.WriteLine($"Рацион питания: {diet}");

    Console.WriteLine("\n\n");
  }
}
