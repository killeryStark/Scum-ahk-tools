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

# count = int(pyautogui.prompt(text='Кол-во повторений', title='Колпочки' , default='1'))
pyautogui.alert(text=text, title='Колпочки')

time.sleep(4)

#Открытие меню крафта
pydirectinput.keyDown("shift")
pydirectinput.press('c')
pydirectinput.keyUp("shift")

#поднятие списка
pydirectinput.click(1904, 129)

#Позиция списка
pydirectinput.click(1913, 453)