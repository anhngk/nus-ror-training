-	List all of ruby version installed : rvm list known
-	Install a ruby version : rvm install <version>
-	Use a version : rvm use <version>
-	Check current default ruby version : ruby - v & folder address : which ruby
-	Set default ruby version : rvm use <version> --default

Gemset
-	Create : rvm gemset create <name>
-	Use : rvm gemset use <name>

-	Switch to a ruby version with a gemset : rvm use <ruby-version>@<gemset-name>
-	Specify a default gemset for a given ruby version : rvm use 2.1.1@<gemset> --default

-	Copy : rvm gemset copy <from> <to> (Ex: 2.1.1@railss4 2.1.2@rails4) / rvm gemset copy 2.1.1 2.1.2
-	Create and use with a ruby version : rvm use 2.1.1@<gemset-name> --create

-	Delete : rvm gemset delete <name> / rvm --force gemset delete <name>
-	Delete from a specific ruby version : rvm <ruby-version> do rvm gemset delete <name>

-	List full dir path for current gemset : rvm gemdir
-	List all named gemset for current ruby version : rvm gemset list
-	List all named gemset for all ruby version : rvm gemset list_all

