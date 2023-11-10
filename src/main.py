import tkinter as tk
import paramiko

def ssh_connect(host, port, username, password):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, port, username, password)
    stdin, stdout, stderr = ssh.exec_command('your command here')
    output = stdout.read().decode().strip()
    ssh.close()
    return output

def create_gui():
    window = tk.Tk()
    window.title("SSH Connection")

    host_label = tk.Label(window, text="Host")
    host_entry = tk.Entry(window)
    port_label = tk.Label(window, text="Port")
    port_entry = tk.Entry(window)
    username_label = tk.Label(window, text="Username")
    username_entry = tk.Entry(window)
    password_label = tk.Label(window, text="Password")
    password_entry = tk.Entry(window, show="*")

    connect_button = tk.Button(window, text="Connect", command=lambda: ssh_connect(host_entry.get(), int(port_entry.get()), username_entry.get(), password_entry.get()))

    host_label.pack()
    host_entry.pack()
    port_label.pack()
    port_entry.pack()
    username_label.pack()
    username_entry.pack()
    password_label.pack()
    password_entry.pack()
    connect_button.pack()

    window.mainloop()

if __name__ == "__main__":
    create_gui()