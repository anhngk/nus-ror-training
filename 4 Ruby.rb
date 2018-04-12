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
