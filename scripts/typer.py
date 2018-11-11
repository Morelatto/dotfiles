#!/usr/bin/env python3

from time import sleep

import pyautogui
import re
import subprocess

SPECIAL_KEYS = {'(': ['shift', '9'], ')': ['shift', '0']}


def get_clipboard_data():
    p = subprocess.Popen(['xclip', '-selection', 'clipboard', '-o'], stdout=subprocess.PIPE)
    return p.stdout.read()


def main():
    data = get_clipboard_data().decode()
    for split in re.split('([' + ''.join(list(SPECIAL_KEYS)) + '])', data):
        if split in SPECIAL_KEYS.keys():
            pyautogui.hotkey(*SPECIAL_KEYS[split])
        else:
            pyautogui.typewrite(split, interval=0.005)


def countdown(amount=3):
    for count in reversed(range(1, amount + 1)):
        print(count)
        sleep(1)


if __name__ == '__main__':
    countdown()
    print('Writing')
    main()
