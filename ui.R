library(shiny)
library(DT)

shinyUI(navbarPage("Shinyサンプルアプリケーション", 
  tabPanel("Home", 
    h1("『RとShinyで作るウェブアプリケーション』のサンプルアプリケーション"), 
    h2("アプリケーション概要"),
    p("オープンソースデータを用いて可視化と分析を行えるShinyアプリです"),
    helpText("サンプルなので、誤りがあるかもしれません")
  ),
  tabPanel("Shinyとは?", 
    h1("Shinyでは以下のようなアプリケーションが作成できます"),
    sidebarLayout(
      sidebarPanel(
        sliderInput(
          "bins_shiny", 
          "Number of bins :",
          min = 1,
          max = 50,
          value = 30
        )
      ),
      mainPanel(
        plotOutput("distPlot_shiny")
      )
    )
  ),
  tabPanel("可視化", 
    h1("可視化"),
    sidebarLayout(
      sidebarPanel(
        selectInput("selected_data_for_plot", 
          label = h3("データを選択してください"), 
          choices = c(
            "アヤメのデータ" = "iris", 
            "不妊症の比較データ" = "infert", 
            "ボストン近郊の不動産価格データ" = "Boston", 
            "スパムと正常メールのデータ" = "airquality", 
            "タイタニックの乗客データ" = "titanic"), 
          selected = "iris"),
        selectInput("select_input_data_for_hist",
          "ヒストグラムを表示する列番号", 
          choices = colnames(iris)), 
        sliderInput("slider_input_data", 
          "Number of bins:", 
          min = 1,
          max = 50, 
          value = 30)          
      ),
      mainPanel(
        tabsetPanel(
          type = "tabs", 
          tabPanel("Table", DT::dataTableOutput("table_for_plot")), 
          tabPanel("ヒストグラム", plotOutput("histgram")),
          tabPanel("散布図"),
          tabPanel("みたいな図を表示する")
        )
      )
    )
  ),
  tabPanel("回帰", 
    sidebarLayout(
      sidebarPanel(), 
      mainPanel(
        tabsetPanel(
          type = "tabs", 
          tabPanel("回帰分析"), 
          tabPanel("プロットで結果を確認")
        )
      )
    )
  ),
  tabPanel("分類", 
    sidebarLayout(
      sidebarPanel(), 
      mainPanel(
        tabsetPanel(
          type = "tabs",
          tabPanel("分類結果"), 
          tabPanel("プロットで結果を確認") 
        )
      )
    )
  ),
  tabPanel("クラスタリング", 
    sidebarLayout( 
      sidebarPanel(),
      mainPanel(
        tabsetPanel(
          type = "tabs", 
          tabPanel("クラスタリング結果"), 
          tabPanel("プロットで結果を確認")
        )
      )
    )
  ),
  navbarMenu("その他",
    tabPanel("about", h2("私の名前は〇〇です")),
    tabPanel("source", a(href="", p()))
  )
))