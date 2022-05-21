import pyautogui
import pydirectinput
import sys
import time

screenWidth, screenHeight = pyautogui.size()

if screenWidth > 1920:
    pyautogui.alert('Скрипт работает только на Fullhd 16:9')
    sys.exit()

text = """
Включите Scum в окне без рамок,
Убедитесь что у вас есть место в инвенторе
Убедитесь что у вас есть режущие инструменты

Подойдите к торговце чтобы скрипт мог активировать интерфейс тогровца F клавишей

У вас есть 4 секунды перед запуском скрипта
"""

count = int(pyautogui.prompt(text='Кол-во повторений', title='Колпочки' , default='1'))
pyautogui.alert(text=text, title='Колпочки')

time.sleep(4)

i = 1
while i <= count:

    #Запуск интерфейса торговца
    pydirectinput.press('f')

    #выбор крафтовых материалов
    time.sleep(3)
    # pydirectinput.moveTo(1529, 384, duration=1, tween=pyautogui.easeInOutQuad)
    pydirectinput.click(1529, 384)
    #поднятие списка
    pydirectinput.click(1904, 129)
    #выбор нужной позиции
    pydirectinput.click(1901, 417)
    # Выбор тряпок
    pydirectinput.click(1762, 507)

    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)

    #Назад
    pydirectinput.click(1492, 1036)

    #Выбор полосок тряпок
    pydirectinput.click(1646, 495)

    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)
    pydirectinput.click(1641, 202)

    #Назад
    pydirectinput.click(1492, 1036)

    #Корзина
    pydirectinput.click(1674, 1047)

    #Купить
    pydirectinput.click(1674, 1047)

    time.sleep(3)

    #Получение материала
    pydirectinput.click(1463, 124)
    pydirectinput.click(1463, 124)

    time.sleep(0.3)

    pydirectinput.click(1511, 122)
    pydirectinput.click(1511, 122)

    time.sleep(0.3)

    pydirectinput.click(1583, 122)
    pydirectinput.click(1583, 122)

    time.sleep(0.3)

    pydirectinput.click(1642, 123)
    pydirectinput.click(1642, 123)

    time.sleep(0.3)

    pydirectinput.click(1701, 122)
    pydirectinput.click(1701, 122)

    time.sleep(0.3)

    pydirectinput.click(1779, 125)
    pydirectinput.click(1779, 125)

    time.sleep(0.3)

    pydirectinput.click(1867, 129)
    pydirectinput.click(1867, 129)

    time.sleep(0.3)

    pydirectinput.click(1467, 195)
    pydirectinput.click(1467, 195)

    time.sleep(0.3)

    pydirectinput.click(1530, 191)
    pydirectinput.click(1530, 191)

    time.sleep(0.3)

    pydirectinput.click(1600, 194)
    pydirectinput.click(1600, 194)

    time.sleep(0.3)

    pydirectinput.click(1648, 188)
    pydirectinput.click(1648, 188)

    time.sleep(0.3)

    pydirectinput.click(1712, 188)
    pydirectinput.click(1712, 188)

    time.sleep(0.3)

    pydirectinput.click(1776, 190)
    pydirectinput.click(1776, 190)

    time.sleep(0.3)

    pydirectinput.click(1836, 191)
    pydirectinput.click(1836, 191)

    #выход
    pydirectinput.click(1492, 1036)

    #Открытие меню крафта
    pydirectinput.keyDown("shift")
    pydirectinput.press('c')
    pydirectinput.keyUp("shift")

    #поднятие списка
    pydirectinput.click(1904, 129)

    time.sleep(0.3)

    #Позиция списка
    pydirectinput.click(1913, 453)

    time.sleep(0.3)

    #Выбор веревки
    pydirectinput.click(1734, 129)

    #Крафт веревки
    pydirectinput.click(1690, 1047)

    time.sleep(12)

    pydirectinput.click(1690, 1047)

    time.sleep(12)

    #Выбор колпочка
    pydirectinput.click(1540, 310)

    #Крафт колпочка
    pydirectinput.click(1690, 1047)

    time.sleep(7)

    pydirectinput.click(1690, 1047)

    time.sleep(7)

    pydirectinput.click(1690, 1047)

    time.sleep(7)

    pydirectinput.click(1690, 1047)

    time.sleep(7)

    #выход из меню
    pydirectinput.press("esc")

    #Запуск интерфейса торговца
    pydirectinput.press('f')

    #Выбор колпачков
    pydirectinput.click(558, 157)
    pydirectinput.click(702, 157)
    pydirectinput.click(790, 157)
    pydirectinput.click(891, 157)

    #Меню продажи
    pydirectinput.click(1626, 56)

    #Продажа
    pydirectinput.click(1791, 1038)

    #Выход
    pydirectinput.click(1492, 1036)

    time.sleep(2)
    i += 1
# print(pydirectinput.position())

# pydirectinput.keyDown("shift")
# pydirectinput.press('c')
# pydirectinput.keyUp("shift")


pyautogui.alert("done")