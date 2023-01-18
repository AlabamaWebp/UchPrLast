using StroiMat.AppData;
using System;
using System.Linq;
using System.Windows.Controls;
using System.Windows.Threading;

namespace StroiMat.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageProduct.xaml
    /// </summary>
    public partial class PageProduct : Page
    {

        public PageProduct()
        {
            InitializeComponent();

            DispatcherTimer timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += UpdateData;
            timer.Start();

        }
        public void UpdateData(object sender, object e)
        {
            var HistoryProd = ConnectToDB.conObj.Product.ToList();
            ListProduct.ItemsSource = HistoryProd;
            ListProduct.ItemsSource = ConnectToDB.conObj.Product.Where(x => x.ProductName.StartsWith(TxtSearch.Text) 
            || x.ProductDescription.StartsWith(TxtSearch.Text)).ToList();
        }
    }
}
