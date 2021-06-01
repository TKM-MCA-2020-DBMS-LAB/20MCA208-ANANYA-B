//(i) Insert at least 5 tuples in each table
//depositor
insert into depositor(cid,dacno)values(111,908);
insert into depositor(cid,dacno)values(222,675);
insert into depositor(cid,dacno)values(333,369);
insert into depositor(cid,dacno)values(444,889);
insert into depositor(cid,dacno)values(555,241); 
//customer
  insert into customer(cid,cname,loc,sex,dob)values(111,"Ajmal","Alappuzha","M",'1889-06-21');
  insert into customer(cid,cname,loc,sex,dob)values(222,"Amala","Kollam","F",'1888-04-2');
  insert into customer(cid,cname,loc,sex,dob)values(333,"Yahib","Juhu","M",'1885-03-20');
  insert into customer(cid,cname,loc,sex,dob)values(444,"Mahi","Mumbai","F",'1880-09-30');
  insert into customer(cid,cname,loc,sex,dob)values(555,"Sam","Raigad","M",'1884-02-3');   
//deposit
 insert into deposit(dacno,dtype,ddate,damt)values(908,"Savings",'2020-05-12',40000);
 insert into deposit(dacno,dtype,ddate,damt)values(675,"Savings",'2015-08-3',12000); 
 insert into deposit(dacno,dtype,ddate,damt)values(369,"Current",'2017-04-23',34000); 
 insert into deposit(dacno,dtype,ddate,damt)values(889,"Current",'2019-05-2',14000);
 insert into deposit(dacno,dtype,ddate,damt)values(241,"Savings",'2021-09-18',21000);
 

//(ii) Display the branch details

select *from bank_brn;

//(iii) List the customers of ‘Mumbai’ city

select cname from customer where loc='Mumbai';

//(iv) List the male customers of ‘Kolkata’city

select cname from customer where loc ='Kolkata' AND sex='M';

//(v) List the state having more than one branch.

select bsate,count(Distinct bsate) from bank_brn ;


//(vi) List the deposit schemes provided by the bank to the customers

 select Distinct dtype from deposit;

//(vii) Delete the entire content of any table

drop deposit;