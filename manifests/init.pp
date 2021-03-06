# Class of this type can be created for every user and hence Database and its respective tables can be created as follows:
class vivekdb {
    mysqldb { "vivek":
        user => "root",
        password => "password",
    }
}
     # User defined Type
     define mysqldb( $user, $password ) {
    
     exec { "create-${name}-db":
     	 	unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
      		#command => "/usr/bin/mysql -uroot -p$password -e \"create database anandan ; grant all on anandan.* to ${user}@localhost identified by '$password';\"",
     	# To create a table
     		# CREATE TABLE Persons(PersonID int, LastName varchar(255), FirstName varchar(255), Address varchar(255), City varchar(255) );
                #onlyif => "/usr/bin/mysql -uroot -p$password -e \"use anandan;CREATE TABLE Persons(PersonID int, LastName varchar(255), FirstName varchar(255), Address varchar(255), City varchar(255) ); \""

      		onlyif => "/usr/bin/mysql -uroot -p$password -e \"use anandan;INSERT INTO Persons (PersonID, LastName, FirstName, Address, City) VALUES (101222, 'Mahadevan', 'Vivekanandan','1/234, Subham Serenity', 'Chennai') ;grant all on vivek.* to ${user}@localhost identified by '$password';\"",
        # Command to retrieve info from the entire table and store it in remote file/Hosts
	        command => "/usr/bin/mysql -uroot -p$password -e \"use anandan;select * from Persons INTO OUTFILE '/tmp/orders.txt';grant all on vivek.* to ${user}@localhost identified by '$password';\"",

  
      
      #require => Service["mysqld"],
    }
  }
