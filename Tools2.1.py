import os
import ctypes
import tkinter as tk
from tkinter import messagebox
import requests

def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False

def run_as_admin():
    ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, " ".join(sys.argv), None, 1)

def get_server_ip_from_file():
    try:
        server_file_url = "https://img.mrkaiyang.top/ip.txt"  # 替换成您服务器上存放IP地址的文本文件的URL
        response = requests.get(server_file_url)
        if response.status_code == 200:
            ip_address = response.text.strip()
            return ip_address
        else:
            return None
    except Exception as e:
        return None

def modify_hosts_with_server_ip():
    domain = "www.shireyishunjian.com"
    ip_to_set = get_server_ip_from_file()  # 获取服务器上的IP地址

    if ip_to_set is None:
        messagebox.showerror("施法失败", "无法获取服务器上的IP地址")
        return

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
    modify_hosts_with_server_ip()

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
