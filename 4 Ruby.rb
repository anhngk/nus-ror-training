Variables
-	Local Variables : defined in a method.Scope: Class-Module-Def - Not available outside method - begin with a lowercase letter or _
-	Instance Variables : available across methods for any particular instance or object - begin with @
-	Class Variables : available across different objects. Belongs to the class and is a characteristic of a class - begin with @@
-	Global Variables : Class variables are not available across classes. If you want to have a single variable, which is available across classes, you need to define a global variable. Begin with $.
-	Pseudo-Variables : self - true - false - nil - __FILE__ - __LINE__
-	Array : arr = [  "fred", 10, 3.14, "This is a string", "last element", ]
-	Hash : 	hsh = colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
			hsh.each do |key, value|
			   print key, " is ", value, "\n"
			end
-	Ranges : (10..15).each do |n| end / 1..15 (1 to 15) / 1...15 (1 to 14)

Operators
-	** : Tính số mũ
-	a <=> b : Toán tử so sánh kết hợp : Return 0 (a=b) / 1 (a>b) / -1 (a<b)
-	.eql? : true if same type and equal values
-	equal? : true if have same object id
-	define?

Statements
-	unless : excute code if conditional is false, If conditional is true -> excute code in else
-	if elsif else
-	case when

Loops
-	while <condition> dosomething code end
-	until <condition> dosomething code end : excute code while conditional is false
-	for index in range dosomething end
-	.each do |index| dosomething end
-	break - next - redo - retry -

Strings
-	%{Ruby is fun.}  equivalent to "Ruby is fun."
	%Q{ Ruby is fun. } equivalent to " Ruby is fun. "
	%q[Ruby is fun.]  equivalent to a single-quoted string
	%x!ls! equivalent to back tick command output `ls`
-	Character encoding : $KCODE = 'a/e/n/u' (a : ASCII / e : EUC / n : none / u : UTF-8)
-	myStr = String.new("This is a new string"); -> foo = myStr.downcase
-	String unpack

Array
-	Array pack directives
-	arr = ['1','2','3','4'] -> arr.fetch(100,"Oops!") => "Oops!"
-	arr.first / arr.last / arr.take(3) => [1,2,3]
-	empty? / include?
-	Add item to array : arr.push(item) / arr << item
-	Add item to beginning of array : arr.unshift(item)
-	Add item to any position : arr.insert(position, 'item')
-	Remove item : 	arr.pop (remove last item)
					arr.shift (retrive + remove first item)
					arr.delete_at(index) (delete at particular index)
					arr.delete() (delete an item)
-	Remove nil values : 	arr.compact (filter ra các item != nil trong arr)
							arr.compact! (delete nil values)
-	Gộp các item trùng lặp : arr.uniq
-	Lặp các item : arr.each {|a| }


Hashes
-	Create : hey = Hash.new("Whatsup") / hey = Hash.new "Whatsup"
-


Inheritance
	class Box
	end

	Subclass:

	class RoundedBox < Box
	end

Freezing Objects
	Freeze an object : object.freeze
	Check if already frozen ? : object.frozen?

File I/O
-	File::exist?() / File.file?()
-	File::directory?()
-	File.readable?()/writeable?()/executable?()
-	File.size?/.zero?
-	File::ftype()
-	File::ctime/::mtime/::atime
-	Navigate through directories
		Dir.chdir("/path/to/dir")
		puts Dir.pwd
		Dir.entries("usr/bin").join(' ') List of the files and directories within a specific directory using Dir.entries
-	Create Dir : Dir.mkdir("name") / Create with permissions Dir.mkdir("name" , 755)
-	Delete Dir : Dir.delete("name")

def func1
  puts "1"
  "1"
end

def func2
  puts "2"
  "2"
end

a = func1 && func2

b == 1 && puts("dsdsdsadadadsa")

Class con kế thừa toàn bộ lớp cha (kể cả private)
Khong co operator ++
Khong co overload

Mảng sort theo độ tuổi tăng dần - gỉam dần
Person.map do -> loop qua các phần tử trong mảng lấy ra 1 thuộc tính
Exception

module ABC
  def TinhTong(a,b)
    a + b
  end
end

class NewClass
  include ABC
  def Add
    TinhTong(1,5)
  end
end

class Person
  attr_accessor :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end
end

list = [
  Person.new("a", 18),
  Person.new("b", 19),
  Person.new("c", 20)
]


  def text
  a = 10
  b = 20
  c = 30
end

if (age > 18)
  true
else
  false
end

@persons.each do |p|
  puts("#{p.name} - #{p.address}")
end

......................
while a < 10 do
 puts ("Ha!")
 i += 1
end
---
until a > 10
 puts ("No!")
 a += 1
end
---
for i in 0..9
 puts ("Bla!")
end
-----
begin
 puts ("He!")
 i += 1
end while (i<10)
----
@persons.each do |p|
  puts("#{p.name} - #{p.address}")
end

....................
while a < 10 do
 if (i == 8) then
  break
 end
end
-------
while a < 10 do
 if (i == 8) then
  break
 end
end
-------



class Person
  attr_accessor :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end
end

list = [
  Person.new("a", 18),
  Person.new("b", 19),
  Person.new("c", 20)
]

list.map { |i| i.age > 18 }