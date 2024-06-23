namespace laba_07
{
    public partial class Form1 : Form
    {
        private int previousWidth;
        private int previousHeight;

        public Form1()
        {
            InitializeComponent();
            this.BackColor = Color.LightBlue;

            this.Resize += Form1_Resize;
            previousWidth = this.Width;
            previousHeight = this.Height;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Random randomRed = new Random();
            Random randomGreen = new Random();
            Random randomBlue = new Random();

            this.BackColor = Color.FromArgb(
                randomRed.Next(0, 256),
                randomGreen.Next(0, 256), 
                randomBlue.Next(0, 256)
             );
        }

        private void Form1_Resize(object sender, EventArgs e)
        {
            if (this.Width < previousWidth)
            {
                int red = this.BackColor.R + (previousWidth - this.Width) <= 255 ? this.BackColor.R + (previousWidth - this.Width) : 255;
                this.BackColor = Color.FromArgb(red, this.BackColor.G, this.BackColor.B);
            }

            if (this.Width > previousWidth)
            {
                int red = this.BackColor.R - (this.Width - previousWidth) > 0 ? this.BackColor.R - (this.Width - previousWidth) : 0;

                this.BackColor = Color.FromArgb(red, this.BackColor.G, this.BackColor.B);
            }

            if (this.Height < previousHeight)
            {
                int green = this.BackColor.G + (previousHeight - this.Height) <= 255 ? this.BackColor.G + (previousHeight - this.Height) : 255;
                this.BackColor = Color.FromArgb(this.BackColor.R, green, this.BackColor.B);
            }

            if (this.Height > previousHeight)
            {
                int green = this.BackColor.G - (this.Height - previousHeight) > 0 ? this.BackColor.G - (this.Height - previousHeight) : 0;

                this.BackColor = Color.FromArgb(this.BackColor.R, green, this.BackColor.B);
            }

            previousWidth = this.Width;
            previousHeight = this.Height;
        }
    }
}
