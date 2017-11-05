1 Remove Duplicate name expression				DISTINCT
2 Max String upper
3 Default TEXT initcap
Min String lower
on delete cascade 
insert into client values(10,'chafih','ahmed','france',12465);

insert into SEJOUR values(20,'Mogadoor','21/sep/2017',4);
select A from T1 INTERSECT select A from T2;
select A from T1 MINUS select A from T2;
select A from T1 UNION select A from T2;

==> select codeart,prixachat from article where prixachat = (select min(prixachat) from article);
==> select sum(prixachat * QTESTK) from article;
==> select AVG(prixachat) from article
==> select count(*) from article;
==> select a,b,c,d,e from T1,T2;
A   B
1   2
3   4
5   6

C   D   E
7   8   9
10  11  12

A   B   C   D   E
1   2   7   8   9
1   2   10  11  12
3   4   7   8   9
3   4   10  11  12
5   6   7   8   9
5   6   10  11  12

delete from nameTable where id = '20'


	select seqDEP.currval from dual;
drop sequence seqDEP;
create sequence seqDEP
	increment by 1
	start with 5;

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	------------------------------------------------------------------------------------------------------------------------------
															PLSQL
	Variable Table.NomDeChemp%Type;


	set serveroutput on
	declare
	n1 varchar2(20);
	n2 number(20);
	begin
	n1:='X';
	n2:=2;
	dbms_output.put_line(n1 || ' ' || n2);
	end;
	/


	if(CONDITION) then
	elsif
	end IF;

	while(CONDITION)
	end loop



	loop 
	exit when (CONDITION)
	end loop;


	FOR i IN 1..10 LOOP

	declare 
	vnom CLIENT1.NOMC%type;
	vcat Client1.CATC%type;
	begin 
	select NOMC,CATC into VNOM,vcat from CLIENT1 where codecli='C004'and CATC=2;
	dbms_output.put_line(VNOM||' '||vcat);
	end;
	/



	declare
	cursor c is select * from Client1 where CATC = 2;
	line CLIENT1%rowtype;
	begin 
	open c;
	loop 
	fetch c into line;
	dbms_output.put_line(line.codecli||' '||line.NOMC||' '||line.CATC||' '||line.valc);
	exit when c%notfound;
	end loop ;
	close c;
	end;
	/



declare
	cursor Cl is( SELECT DISTINCT client1.nomC,client1.codecli  from CLIENT1,COMMENDE where Commende.codecli = CLIENT1.codecli);
	VNOM CLIENT1.NOMC%type;
	VCODE CLIENT1.codecli%type;
	begin 
	open Cl;
	loop 
	fetch Cl into Vnom,Vcode;
	dbms_output.put_line(VNOM||' '||Vcode);
	exit when Cl%notfound;
	end loop;
	close cl;
	end;
	/

	declare 
	cursor cli is (select * from CLIENT1 where CATC = 2);
	line client1%rowtype;
	begin 
	for line in cli 
	loop 
	dbms_output.put_line(line.codecli || line.NOMC);
	end loop;
	end;
	/

	declare
	cursor c is ( SELECT DISTINCT client1.nomC,client1.codecli  from CLIENT1,COMMENDE where Commende.codecli = CLIENT1.codecli);
	vnom CLIENT1.NOMC%type;
	vcode CLIENT1.codecli%type;
	begin
	for VNOM in c 
	loop 
	dbms_output.put_line(vnom||' '||vcode);
	end loop;
	end;
	/


/*Procedure*/
		create or replace procedure p1 (resultat in out number) is 
			begin 
			select count(*) into resultat from ARTICLE;
			dbms_output.put_line(resultat);
			end; /

		declare
		v1 number;
		begin 
		p1(v1);
		end; /

/*Function*/
		create or replace function f1 
			return number is
			resultat number;
			 begin
			SELECT COUNT(*) into resultat from ARTICLE;
			return resultat;
			end; /

			declare
			v1 number;
			begin 
			v1:=f1;
			dbms_output.put_line(v1);
			end; /

			create or replace function Art(maxx in out number , minn in out number) return varchar2 is 
				nom varchar2(20);
				begin 
				select max(PRIXVENT),min(PRIXVENT) into maxx,minn from ARTICLE;
				select noma into nom FROM ARTICLE where PRIXVENT = maxx ;
				return nom;
				end; /
show errors

declare 
v1 varchar2(20);
v2 number;
v3 number;
begin 
v1:=art(v2,v3);
dbms_output.put_line('Le Nom de article '||v1||' et le MAX est '||v2||' et le MIN est '||v3);
end; /

			





 morpheus