HOMEWORK
- Lấy chữ số input
- Truyền vào hàm eval()
- Có kết quả dùng jQuery show ra

Requirement
- Button : Hover đổi màu - Press lún xuống - Unpress nhả ra
- Layout mobile : Hiển thị 2 cột button theo thứ tự từ 0 - 9 + - x : = clear
- Lịch sử tính toán : Dưới ô hiển thị kết quả - Dropdown - Chọn history record -> Tính + Hiển thị kết quả
- Clear button : Show modal confirm Clear or not
- Ô kết quả khi đã tính toán - Tính 1 phép tính mới, clear màn hình - Show phép tính mới
- Toggle button : Active -> Show 4 button sin cos tan cotg

----------------------------------
 Aware of Syntax - Variables - Data Types - OOP when approaching a new programming language.
----------------------------------

	2.3 Javascript

-	Can be place in <body> <head>
-	<script></script>
-	Using document.write() after an HTML document is fully loaded, will delete all existing HTML
-	Case sensitive : lastName vs lastname -> different variables
-	var x = "5" + 2 + 3 -> "523" / var x = 2 + 3 + "5" -> "55"
-	100 ** 3 == 100^3
-	Data type of 'null' is an object - 'null' is nothing 
	typeof undefined           // undefined
	typeof null                // object

	null === undefined         // false
	null == undefined          // true

-	typeof [array] -> object
-	typeof function -> function
-	Scope : If you assign a value to a variable that has not been declared, it will automatically become a GLOBAL variables
-	slice(from,to) / substr(from,length)
-	String methods : split() / charAt() / charCodeAt() / concat() / toUpper(Lower)Case() / replace() / substr() / slice() / search() / indexOf() / lastIndexOf() / length()
-	typeof NaN -> number
-	Infinity
-	Number methods : toString() / toExponential() / toFixed() / toPresision() / valueOf() / Number() / parseInt() / parseFloat() / 
-	Math.PI/.round()/.pow()/.sqrt()/.abs()/.ceil()/.floor()/.sin()/.cos()/.tan()/.min()/.max()/.random()
-	Math.random() return a ramdon number 0 -> 1 (exclusive)
-	Date methods : toUTCString() / toDateString()
-	Adding array elements (2 ways): fruits.push("Lemon") / fruits[fruits.length] = "Lemon"
-	Difference between Array & Object : array -> numbered indexes / object -> named indexes
-	Array methods : toString() / join('separate symbol') / pop() / shift() (opposite to pop()) / unshift() / splice() / concat() - merging 2 array / sort() / resverse()
-	Compare function : function(a,b){ return a-b}
-	Array Sort
-	5 Datatype contain values : string/number/boolean/object/function
-	3 types of objects : Object/Date/Array (Maths/RegExp)
-	2 Datatype can not contain data : null / undefined

------------------------------------------------------
	2.4 Bootstrap
-	< 576px < 768px < 992px < 1200px <
-	.no-gutters Columns have horizontal padding to create the gutters between individual columns, however, you can remove the margin from rows and padding from columns with .no-gutters on the .row.


------------------------------------------------------
	2.5 jQuery

-	jQuery Effects :
	+	Hide/Show : hide()/show()/toggle()
	+	Fade : fadeIn()/fadeOut()/fadeToggle()/fadeTo() : fadeTo an give opacity

-	Different between : on - bind - delegate
	+ bind : Chỉ có tác dụng với các thẻ đang tồn tại trong trang, không có tác dụng cho các thẻ được thêm vào
	
-	jQuery DOM Manipulation Methods : append() / before() / after() / prepend() / append() / remove() / replaceAll() / wrap()

	jQuery AJAX

-	dataType : xml / json / jsonp / text / script / html
-	Method : GET - POST - PUT
-	async : Asynchronus (default : true) / Synchronus
-	Callbacks : success/error/complete/beforeSend/

-	Lấy ra các div có thứ tự là bội của 3 : $('div:nth-child(3n)')
-	Lấy ra div kế cuối : $('div:last-child(2)')
-	$('form').valid()

var object = {firstName: 'Anh', lastName: 'Nguyen', fullName(){ return this.firstName + " " + this.lastName; }};

