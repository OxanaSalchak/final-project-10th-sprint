#!/bin/bash

# создаём каталог task с вложенными директориями
# task
#   dir1
#   dir2
#   dir3
#       dir4
 mkdir /task
 mkdir -p /task/dir1 
 mkdir -p /task/dir2
 mkdir -p /task/dir3/dir4
 ls

# изменяем текущую директорию на task
 cd task

# создаём пустой файл task/dir2/empty
 cd dir2
 touch empty.txt

# создаём файл task/dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"
 touch hello.sh
 nano hello.sh
 #!/bin/bash
 echo "$NAME, привет!"
 ctrl+S
 ctrl+x
 cat hello.sh

# устанавливаем для task/dir2/hello.sh права rwxrw-r--
 chmod 764 hello.sh

# сохраняем список файлов task/dir2 в task/dir2/list.txt
 touch list.txt
 cd..
 ls dir2 > list.txt

# копируем содержимое каталога task/dir2 в каталог task/dir3/dir4
 cp -r -T dir2 dir3/dir4

# записываем в task/dir1/summary.txt список файлов с расширением *.txt
# находящихся в task, включая поддиректории
 touch dir1/summary.txt
 find task -type f -name "*.txt" > task/dir1/summary.txt

# дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt
 cat task/dir1/summary.txt >> task/dir2/list.txt

# определяем переменную окружения NAME со значением "Всем студентам"
 export NAME="Всем студентам"

# запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
# вывод скрипта должен дописаться в файл task/dir1/summary.txt
 task/dir2/hello.sh >> task/dir1/summary.txt

# перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание
 mv task/dir1/summary.txt task/'Практическое задание'

# выводим на консоль содержимое файла task/Практическое задание
 cat task/'Практическое задание'

# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем отсортировываем их
 grep -i "dir" task/'Практическое задание' | sort

# меняем текущую директорию на родительскую для task
 cd ..

# удаляем директорию task со всем содержимым
 rm -rf task
