__version__ = "2.0.1"
__author__ = "超级可爱的大笨蛋忾氧纸尿裤无限公司"

import os
import ctypes
import tkinter as tk
from tkinter import messagebox


def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False


def run_as_admin():
    ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, " ".join(sys.argv), None, 1)


def modify_hosts():
    domain = "www.shireyishunjian.com"
    ip_to_set = "172.67.193.224"
    hosts_path = "C:\\Windows\\System32\\drivers\\etc\\hosts"

    if not is_admin():
        run_as_admin()
        exit()

    try:
        with open(hosts_path, "r") as file:
            lines = file.readlines()

        found = False
        modified_lines = []
        for line in lines:
            if domain in line:
                found = True
                modified_lines.append(f"{ip_to_set} {domain}\n")
            else:
                modified_lines.append(line)

        if not found:
            modified_lines.append(f"{ip_to_set} {domain}\n")

        with open(hosts_path, "w") as file:
            file.writelines(modified_lines)

        messagebox.showinfo("施法完成", "魔法已经成功被打败")

    except Exception as e:
        messagebox.showerror("施法失败", f"施法时发生错误：{e}")


def on_modify_button_click():
    modify_hosts()


# 创建主窗口
root = tk.Tk()
root.title("不用魔法上湿热小工具")
root.geometry("300x150")

# 创建标签和按钮
label = tk.Label(root, text="用魔法打败魔法！")
label.pack(pady=20)

modify_button = tk.Button(root, text="开始施法！", command=on_modify_button_click)
modify_button.pack()

# 运行主循环
root.mainloop()
