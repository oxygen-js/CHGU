Menu menuValue = Menu.HOME;
List<Footballer> footballers = new List<Footballer> { };


Footballer footballerAndrey = new("Andrey Ivanov", "Barsa", 10, 1);
Footballer footballerSergey = new("Sergey Petrov", "Spartak", 10, 5);
Footballer footballerTarik = new("Tarik Elphahli", "CSK", 10, 1);
Footballer footballerKazakov = new("Andrey Kazakov", "Barsa", 20, 8);
Footballer footballerIvan = new("Ivan Ivanov", "CSK", 24, 10);

footballers.Add(footballerAndrey);
footballers.Add(footballerSergey);
footballers.Add(footballerTarik);
footballers.Add(footballerKazakov);
footballers.Add(footballerIvan);

do
{
    switch(menuValue)
    {
        case Menu.HOME:
            printMenu();
            break;
        case Menu.ADD:
            addItem(footballers, out menuValue);
            break;
        case Menu.DELETE:
            deleteItem(footballers, out menuValue);
            break;
        case Menu.PRINT:
            printCollections(footballers, out menuValue);
            break;
        case Menu.STATISTICS:
            Footballer.statistics(footballers);
            backToHome(out menuValue);
            break;
    }
} while (menuValue != Menu.EXIT);


void printMenu()
{
    Console.WriteLine("(1) Add");
    Console.WriteLine("(2) Delete");
    Console.WriteLine("(3) Print");
    Console.WriteLine("(4) Statistics");
    Console.WriteLine("(0) Exit");
    Console.WriteLine("");
    Console.Write("Select menu options: "); 
    menuValue = convertMenuOption(Console.ReadLine() ?? "1");
    Console.Clear();
}

Menu convertMenuOption(string option)
{
  if (option == "1") return Menu.ADD;
  if (option == "2") return Menu.DELETE;
  if (option == "3") return Menu.PRINT;
  if (option == "4") return Menu.STATISTICS;
  if (option == "0") return Menu.EXIT;

  return Menu.EXIT;
}

void addItem(List<Footballer> footballers, out Menu menuValue)
{
  Console.Write("FIO: ");
  string fio = Console.ReadLine() ?? "";
  if (checkInt(fio))
  {
    Console.WriteLine("Invalid value.");
    backToHome(out menuValue);
    return;
  }

  Console.Write("Club: ");
  string club = Console.ReadLine() ?? "";
  if (checkInt(club))
  {
    Console.WriteLine("Invalid value.");
    backToHome(out menuValue);
    return;
  }

  Console.Write("Count games: ");
  string countGame = Console.ReadLine() ?? "0";
  if (!checkInt(countGame))
  {
    Console.WriteLine("Invalid value.");
    backToHome(out menuValue);
    return;
  }

  Console.Write("Yellow card: ");
  string yellowCard = Console.ReadLine() ?? "0";
  if (!checkInt(yellowCard))
  {
    Console.WriteLine("Invalid value.");
    backToHome(out menuValue);
    return;
  }

  footballers.Add(new Footballer(fio, club, int.Parse(countGame), int.Parse(yellowCard)));

  backToHome(out menuValue);
}

void deleteItem(List<Footballer> footballers, out Menu menuValue)
{
  int index = int.Parse(Console.ReadLine() ?? "0");
  if (index > footballers.Count)
  {
    Console.WriteLine("The index is greater than the number of items in the list");
  }
  else
  {
    footballers.RemoveAt(index);
  }

  backToHome(out menuValue);
}

void printCollections(List<Footballer> footballers, out Menu menuValue)
{ 
  if (footballers.Count == 0)
  {
    Console.Write("List empty...");
  }
  else
  {
    foreach (Footballer footballer in footballers)
    {
      footballer.print();
    }
  }

  backToHome(out menuValue);
}

void backToHome(out Menu menuValue)
{
  Console.Write("Press any key: ");
  Console.ReadLine();
  menuValue = Menu.HOME;
  Console.Clear();
}

bool checkInt(string text)
{
  int num;
  bool isInt = int.TryParse(text, out num);
  return isInt;
}

struct Footballer
{
    private string fio;
    private string club;
    private int countGames;
    private int yellowCard;

    public Footballer(string fio, string club, int countGames, int yellowCard)
    {
        this.fio = fio;
        this.club = club;
        this.countGames = countGames;
        this.yellowCard = yellowCard;
    }

    public void print()
    {
        Console.WriteLine($"Fio - {fio}");
        Console.WriteLine($"Club - {club}");
        Console.WriteLine($"Count games - {countGames}");
        Console.WriteLine($"yellowCard - {yellowCard}\n\n");
    }

    public double getAverageGames()
    {
      return (double)countGames / (double)yellowCard;
    }

    public static void statistics(List<Footballer> footballers)
    {
        List<Footballer> bads = new List<Footballer> { };
        List<Footballer> goods = new List<Footballer> { }; 

        double min = 0;
        double max = 0;

        foreach (Footballer footballer in footballers)
        {
            double average = footballer.getAverageGames();
            if (average >= min)
            {
              min = average;
            }
            else
            {
              max = average;
            }
        }

        foreach (Footballer footballer in footballers)
        {
            double average = footballer.getAverageGames();
            if (average == max)
            {
              bads.Add(footballer);
            }

            if (average == min)
            {
              goods.Add(footballer);
            }
        }

        Console.WriteLine("Neat footballers: ");
        foreach (Footballer footballer in goods)
        {
          footballer.print();
        }

        Console.WriteLine("\n");

        Console.WriteLine("Rude footballers: ");
        foreach (Footballer footballer in bads)
        {
          footballer.print();
        }
  }
}

enum Menu
{
  ADD,
  DELETE,
  PRINT,
  STATISTICS,
  HOME,
  EXIT
}