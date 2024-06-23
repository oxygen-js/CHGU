string filePath = "objects.txt";
List<Bird> birds = [];

try
{
  string[] lines = File.ReadAllLines(filePath);
  foreach (string line in lines)
  {
    string[] parts = line.Split(',');
    foreach (string className in parts)
    {
      switch (className.Trim())
      {
        case "Sparrow":
          birds.Add(new Sparrow(age: 2, 3.3f, 2.3f));
          break;
        case "Eagle":
          birds.Add(new Eagle(2, 3.3f, 10.3f, ["mouse", "bird"], 3.3));
          break;
        case "Predator":
          birds.Add(new Predator(2, 6.5f, 5.4, ["mouse", "bird"]));
          break;
      }
    }

  }
}
catch (Exception error)
{
  Console.WriteLine($"Error: {error.Message}");
}

birds[0].Eat();
birds[1].Eat();
birds[2].Eat();
birds[3].Eat();

Console.WriteLine($"Weight: {birds[1].Weight()}");


class Sparrow : Bird
{
  public float Height;
  public float Width;
  public Sparrow(int age, float height, float width) : base(age, height)
  {
    Height = height;
    Width = width;
  }
  
  public override void Eat()
  {
    Console.WriteLine("Орёл ест зёрна");
  }
  
  public override double Weight()
  {
    return ((Height + Width) - 10) * 0.7;
  }
}

class Eagle : Predator
{
  public double Scope;
  public Eagle(int age, float height, double width, string[] diet, double scope) : base(age, height, width, diet)
  {
    Scope = scope;
  }
  
  public override void Eat()
  {
    Console.WriteLine("Орёл ест мясо");
  }
}

class Predator : Bird
{
  public double Width;
  public string[] Diet;

  public Predator(int age, float height, double width, string[] diet) : base(age, height)
  {
    Diet = diet;
    Width = width;
  }

  public override double Weight()
  {
    return ((Height + Width) - 20) * 0.8;
  }

  public override void Eat()
  {
    Console.WriteLine("Хищная птица ест мясо");
  }
}

abstract class Bird
{
  public int Age;
  public float Height;
  
  public Bird(int age, float height)
  {
    Age = age;
    Height = height;
  }
  
  public virtual double Weight()
  {
    return (Height - 10) * 0.3;
  }

  public abstract void Eat();
}
