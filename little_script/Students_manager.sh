banner(){
	echo ---------------------------------
}

memu(){
	banner
	echo [+] Sutdent management system [+]
	banner
	echo 1.ADD
	echo 2.DELETE
	echo 3.SEARCH
	echo 4.UPDATE
	echo 5.INFO
	echo 6.init
	echo 7.quit
	banner
	echo tips:press number of the mode
	banner
}

init(){
	sudo mysql -e "
	create database Student;
	use Student;
	create table 'students_info'(
	'studentname' char[10],
	'studentID' int,
	'Building_num' int,
	'Room_num' int,
	);
	quit
	"
	echo init complete
}

ADD(){
	studentname="$1"
	studentID="$2"
	Building_num="$3"
	Room_num="$4"
	sudo mysql -e '
	use Student;
	insert into students_info
	(studentname,studentID,Building_num,Room_num)
	values
	("'"$1"'","'"$2"'","'"$3"'","'"$4"'");
	quit
	'
	echo add complete
}

DELETE(){
	deleted_label="$1"
	deleted_value="$2"
	sudo mysql -e "
	use Student;
	delete form students_info where $deleted_label = $deleted_value;
	quit
	"
	echo delete complete
}

UPDATE(){
	info_label="$1"
	info="$2"
	update_label="$3"
	update_value="$4"
	sudo mysql -e"
	use Student;
	update students_info set $update_label = $update_value where $info_label = $info;
	quit
	"
	echo update success!
}

SEARCH(){
	search_label="$1" 
	#result is students_name column
	search_id="$2" 
	#requset is student sepeical info as students name or id
	search_value="$3" 
	#sutdent special info as students name john.
	
	#usage:SEARCH Room_num id 1
	#will search in table 
	#select Room_num from students_info where id=1

	sudo mysql -e "
	use Student;
	select $search_label from students_info where $search_id = $search_value;
	quit
	"
}


#if you need pass and username to login
#you can alias mysql="mysql -u -p"

while :
do
	memu
	echo choose your command mode you want do
	read mode_cmd
	clear
	case $mode_cmd in
		1)
			echo add student mode up!
			read -p 'add student name' name
			read -p 'add student id' id
			read -p 'add student building number' build_num
			read -p 'add student room number' room_num
			ADD $name $id $build_num $room_num
			;;
		2)
			echo delete student mode up!
			echo 
			echo tips: you need input what you want delete in this mode
			echo as you want delete all student in 404
			echo you need press 404 in frist blank and Room_num in second _blank
			echo
			read -p 'what student you want delete?' value
			read -p 'what kind of value is?id or name' key
			DELETE $key $value
			;;
		3)
			echo search mode up!
			echo
			echo tips: you need input what you want search in this mode
			echo as you want know who is in room 502
			echo you need press 502 in frist blank and Room_num in seacond blank
			echo 
			read -p 'what you want search?' value
			read -p 'what kind of value is?id or name' key
			SEARCH * $key $value
			;;
		4)
			echo update value mode is up!
			echo
			echo tips: you need input what value want delete and its keyname 
			echo also you need another 2 to locate its line in our table
			echo as you want change id 2 to 3 and the student name is jack
			echo you need press id in first blank
			echo 3 to second blank
			echo studentname to third blank
			echo jack in fourth blank
			echo each of them divided by [::space:]
			echo id 3 studentname jack
			echo 
			read -p 'what you want update' $id $value_toupdate $locate_key $locate_value
			UPDATE $lacate_key $locate_value $id $value_toupdate
			;;
		5)
			echo "
label and database will be set as
create database Student
create table 'students_info'
'studentname' char[10],
'studentID' int,
'Building_num' int,
'Room_num' int

if you need any like mysql like root and pass=1222
you can alias mysql='mysql -u -p'
and unset it after finsh you task
"
			echo
			;;
		6)
			echo init start
			init
			echo init complete
			;;
		7)
			echo thanks
			break
			;;

		*)
			echo wrong command
			;;
	esac
	clear
done
