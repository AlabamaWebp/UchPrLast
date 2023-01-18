﻿using StroiMat.AppData;
using StroiMat.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace StroiMat
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            ConnectToDB.conObj = new TradeEntities();
            FrameObj.frameMain = frmMain;

            frmMain.Navigate(new Page1());
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            frmMain.Navigate(new Page1());
        }
    }
}
