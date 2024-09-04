import time
import subprocess

print ("   _____ ____  ______                     __                    ")
print ("  / ___// __ \/ ____/  ____ _____  ____ _/ /_  __________  _____")
print ("  \__ \/ / / / /      / __ `/ __ \/ __ `/ / / / / ___/ _ \/ ___/")
print (" ___/ / /_/ / /___   / /_/ / / / / /_/ / / /_/ (__  )  __/ /    ")
print ("/____/\____/\____/   \__,_/_/ /_/\__,_/_/\__, /____/\___/_/     ")
print ("                                        /____/                  ")
print ("\nСправка: [(ключ_логов) (дамп_трафика) (анализ_hayabusa) (проверка_файла_capa)]\nОпции:\n1. (ключ_логов)\n all -> полная выгрузка\n main -> только Security, Sysmon и Application\n n -> нет\n2. (дамп_трафика)\n y -> Да\n n -> нет\n3. (анализ_hayabusa)\n all -> анализ Security и Sysmon\n s1 -> анализ Security\n s2 -> анализ Sysmon\n n -> нет\n\nПример написания: main n all")

options = str(input()).split()

print ("\nВведите имя устройства или IP адрес:")
hostname = str(input())

#subprocess.run("start {}".format(
#        ".\Resources\Bat\cmd_dumper.bat" + " " + hostname),
#                   shell=False)

subprocess.run([".\Resources\Bat\cmd_dumper.bat", str(hostname)], shell=False)

if (options[0] != "n"):
    subprocess.run([".\Resources\Bat\log_dumper.bat", str(hostname), str(options[0])], shell=False)

if (options[1] != "n"):
    print("Сколько секунд собирать трафик?")

    seconds = str(input())

    subprocess.run(['.\Resources\Bat\\traffic_dumper.bat', str(hostname), str(seconds)], shell=False)

if (options[2] != "n"):
    subprocess.run("start {}".format(
        ".\Resources\Bat\hayabusa_analyser.bat" + " " + hostname + " " + options[2]), shell=True)
