#language:en
Feature: проверка наличия товара

  @ui @positive
  Scenario: Проверка наличия товара
    When пользователь переходит на сайт 'https://market.yandex.ru/'
    Then тайтл верен 'Интернет-магазин Яндекс Маркет'

    When пользователь переходит в 'Каталог'
    * наводит курсор на раздел 'Ноутбуки и компьютеры' и переходит в раздел 'Ноутбуки'
    Then тайтл верен 'Ноутбуки'

    When пользователь задает параметр «Цена, Р» от '10000' до '30000' рублей
    * выбирает производителя 'HP' и 'Lenovo'
    Then на первой странице отобразилось более '12' элементов товаров

    When пользователь открывает все предложения
    Then товар соответствуют фильтру
      | HP     |
      | Hp     |
      | hp     |
      | НР     |
      | Нр     |
      | нp     |
      | hр     |
      | Lenovo |
      | LENOVO |
      | lenovo |

    When пользователь возвращается на первую страницу с результатами поиска ноутбуков
    * пользователь запоминает первое наименование ноутбука
    * пользователь вводит в поисковую строку запомненное значение
    * пользователь нажимает кнопку 'Найти'
    Then в результатах поиска, на первой странице, есть искомый товар